# frozen_string_literal: true

# SSD and HDD csv files from userbenchmark are currently
# strucutered incorrectly so, reading these files using
# ruby's built in CSV class does not work

# Constants related to these files are commented out
# in hopes of a change in the future

class UbCSVFormatter
    class << self
        require 'csv'

        # / Directories /
        CSV_DIR = "#{Rails.root}/lib/userbenchmark/csv_files/".freeze
        SAVE_DIR = "#{Rails.root}/lib/userbenchmark/reformatted_csv_files/".freeze
        # / File names /
        RAM = 'RAM_UserBenchmarks.csv'
        GPU = 'GPU_UserBenchmarks.csv'
        CPU = 'CPU_UserBenchmarks.csv'
        # SSD = 'SSD_UserBenchmarks.csv'
        # HDD = 'HDD_UserBenchmarks.csv'
        # / Data types /
        Memory_Size = 'Memory Size'
        Memory_Type = 'Memory Type'
        CAS_Latency = 'CAS Latency'
        Speed = 'Speed'
        # Bus_Type = 'Bus Type'
        Storage_Space = 'Storage Space'
        # Form_Factor = 'Form Factor'
        # / Regexps for data types /
        Byte_Size_Reg = /\s\d+\w*[GT]B/.freeze
        Memory_Type_Reg = /\sDDR\d{1}/.freeze
        CAS_Latency_Reg = /\sC\d+/.freeze
        Speed_Reg = /\s\d{4}/.freeze
        # Bus_Type_Reg = /(NVMe PCIe)*(\w*SATA)*/.freeze
        # Form_Factor_Reg = /M\.2/.freeze

        def reformat(file)
            if file === CPU
                IO.copy_stream(CSV_DIR + file, SAVE_DIR + file)
                return
            end

            data = format_csv_table(file)
            write_csv(data, SAVE_DIR + file)
        end

        private
        # create table from csv file
        def create_table(file)
            table = nil

            case file
            when GPU
                table = CSV.read(CSV_DIR + GPU, headers: true)
            when RAM
                table = CSV.read(CSV_DIR + RAM, headers: true)
            # when HDD
                # table = CSV.read(CSV_DIR + HDD, headers: true)
            # when SSD
                # table = CSV.read(CSV_DIR + SSD, headers: true)
            end

            return table
        end

        # create a headers array for data collection
        def create_headers_arr(file)
            arr = []
            
            case file
            when GPU
                arr = [Memory_Size]
            when RAM
                arr = [Memory_Size, Memory_Type, CAS_Latency, Speed]
            # when HDD
                # arr = [Bus_Type, Storage_Space, Form_Factor]
            # when SSD
                # arr = [Bus_Type, Storage_Space, Form_Factor]
            else
                return
            end

            return arr
        end
        
        # loop through model col to seperate data types
        def parse_model_col(model_col, arr, cur_row = 0)
            return arr if cur_row === (model_col.length)
            # loop through headers subarray           
            arr[0].each_with_index do |header, i|
                arr << [] if arr[i + 1].nil?
                # extract data from row that matches header
                data = extract_data!(header, model_col, cur_row)
                if data.nil?
                    arr[i + 1] = data
                    next
                end
                arr[i + 1] << data.strip!
            end
            model_col[cur_row]

            arr = parse_model_col(model_col, arr, cur_row + 1)
        end

        # extract data from row while altering model column from CSV table
        def extract_data!(header, col, row)
            return col[row].slice! Byte_Size_Reg.match(col[row])[0] if header === Memory_Size || header === Storage_Space
            return col[row].slice! Memory_Type_Reg.match(col[row])[0] if header === Memory_Type 
            return col[row].slice! CAS_Latency_Reg.match(col[row])[0] if header === CAS_Latency
            return col[row].slice! Speed_Reg.match(col[row])[0] if header === Speed
        end
        
        # update csv table with restructured data using 
        # headers subarray and subsequent array of that header
        def update_csv_table(table, arr)
            arr[0].each_with_index do |header, i|
                table[header] = arr[i + 1]
            end
            
            return table
        end

        def format_csv_table(file) 
            arr = []
            table = create_table(file)
            model_col = table.by_col![3]

            # insert headers subarray into array for data collection 
            arr << create_headers_arr(file)
            # parse model column for new header data types
            arr = parse_model_col(model_col, arr)
            # update csv table with restructured data
            table = update_csv_table(table, arr)
        end

        def write_csv(data, file)
            CSV.open(file, "w") do |csv|
                csv << data.headers
                data.by_row.each{|row| csv << row}
            end
        end
    end
end

