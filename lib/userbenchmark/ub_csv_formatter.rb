require 'csv'

class UbCSVFormatter
    class << self
        CSVDIR = './lib/userbenchmark/csv_files/'.freeze
        SAVEDIR = './lib/userbenchmark/reformatted_csv_files/'.freeze
        RAM = 'RAM_UserBenchmarks.csv'.freeze
        GPU = 'GPU_UserBenchmarks.csv'.freeze
        Memory_Size_Reg = /\d+\w*GB/.freeze
        Memory_Type_Reg = /DDR\d{1}/.freeze
        CAS_Latency_Reg = /C\d+/.freeze
        Speed_Reg = /\d{4}/.freeze
        Memory_Size = "Memory Size".freeze
        Memory_Type = "Memory Type".freeze
        CAS_Latency = "CAS Latency".freeze
        Speed = "Speed".freeze

        def reformat(file)
            return if file != GPU && file != RAM

            data = format_csv_table(file)
            write_csv(data, SAVEDIR + file)
        end

        private
        # create a headers array for data collection
        def create_headers_arr(type)
            arr = []
            arr << Memory_Size
            if type === RAM
                arr << Memory_Type
                arr << CAS_Latency
                arr << Speed
            end

            return arr
        end
        
        # loop through model col to seperate data types
        def parse_model_col(model_col, arr, cur_row = 0)
            return arr if cur_row === (model_col.length)
            # loop through headers subarray
            # extract data from row that matches data type of that header
            arr[0].each_with_index do |header, i|
                arr << [] if arr[i + 1].nil?
                arr[i + 1] << extract_data!(header, model_col, cur_row)
            end
            model_col[cur_row].strip!

            arr = parse_model_col(model_col, arr, cur_row + 1)
        end

        # extract data from row while altering model column from CSV table
        def extract_data!(header, col, row)
            return col[row].slice! Memory_Size_Reg.match(col[row]).to_s if header === Memory_Size
            return col[row].slice! Memory_Type_Reg.match(col[row]).to_s if header === Memory_Type
            return col[row].slice! CAS_Latency_Reg.match(col[row]).to_s if header === CAS_Latency
            return col[row].slice! Speed_Reg.match(col[row]).to_s if header === Speed
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
            table = nil
            type = nil
            arr = []
            
            if file === GPU
                table = CSV.read(CSVDIR + GPU, headers: true)
                type = GPU
            end
            if file === RAM
                table = CSV.read(CSVDIR + RAM, headers: true)
                type = RAM
            end

            model_col = table.by_col![3]
            # insert headers subarray into array for data collection 
            arr << create_headers_arr(type)
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

