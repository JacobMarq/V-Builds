# frozen_string_literal: true

# SSD and HDD csv files from userbenchmark are currently
# strucutered incorrectly so, reading these files using
# ruby's built in CSV class does not work

# Constants related to these files are commented out
# in hopes of a change in the future

class UbSeed
    class << self
        require 'csv'

        FORMATTED_CSV_DIR = "#{Rails.root}/lib/userbenchmark/reformatted_csv_files/".freeze
        CSV_FILES = [
            RAM = 'RAM_UserBenchmarks.csv',
            CPU = 'CPU_UserBenchmarks.csv',
            GPU = 'GPU_UserBenchmarks.csv',
            # SSD = 'SSD_UserBenchmarks.csv',
            # HDD = 'HDD_UserBenchmarks.csv'
        ].freeze
        
        def import_components
            for file in CSV_FILES do
                @table = CSV.read(FORMATTED_CSV_DIR + file, headers: true)
                create_components
            end
        end
        
        private
        def create_components
            type = Type.find_by! name: @table[1]["Type"]
            @table.each {|row|
                component = Component.create({
                    part_number: row['Part Number'],
                    brand: row['Brand'],
                    model: row['Model'],
                    ub_rank: row['Rank'],
                    ub_benchmark: row['Benchmark'],
                    ub_samples: row['Samples'],
                    ub_link: row['URL'],
                    type_id: type.id})}
        end
    end
end