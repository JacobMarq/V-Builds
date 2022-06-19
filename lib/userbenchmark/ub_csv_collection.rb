# frozen_string_literal: true

# SSD and HDD csv files from userbenchmark are currently
# strucutered incorrectly so, reading these files using
# ruby's built in CSV class does not work

# Constants related to these files are commented out
# in hopes of a change in the future

class UbCSVCollection
    require 'open-uri'
    require_relative 'ub_csv_formatter'

    URL = 'https://www.userbenchmark.com/resources/download/csv/'
    READY_DIR = "#{Rails.root}/lib/userbenchmark/reformatted_csv_files/".freeze
    CSV_DIR = "#{Rails.root}/lib/userbenchmark/csv_files/".freeze
    CSV_FILES = [
        RAM = 'RAM_UserBenchmarks.csv',
        CPU = 'CPU_UserBenchmarks.csv',
        GPU = 'GPU_UserBenchmarks.csv',
        # SSD = 'SSD_UserBenchmarks.csv',
        # HDD = 'HDD_UserBenchmarks.csv'
    ].freeze

    # download or update userbenchmark csv files if they do not exist
    # or if the file size has changed indicating an update
    # then see if the new csv file requires formating
    def self.collect_csv_files
        for file in CSV_FILES do
            download = URI.parse(URL + file).open
            
            if File.exist?(CSV_DIR + file)
                next if File.size?(CSV_DIR + file) === File.size?(download)
            end

            IO.copy_stream(download, CSV_DIR + file)
            UbCSVFormatter.reformat(file)
        end
    end
end