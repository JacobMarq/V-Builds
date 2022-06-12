require 'open-uri'
require_relative 'ub_csv_formatter'

class UbCSVCollection
    URL = 'https://www.userbenchmark.com/resources/download/csv/'.freeze
    CSVDIR = './lib/userbenchmark/csv_files/'.freeze
    CSVFILES = [
        RAM = 'RAM_UserBenchmarks.csv',
        CPU = 'CPU_UserBenchmarks.csv',
        GPU = 'GPU_UserBenchmarks.csv',
        SSD = 'SSD_UserBenchmarks.csv',
        HDD = 'HDD_UserBenchmarks.csv'
    ].freeze

    #download or update userbenchmark csv files if they do not exist
    #or if the file size has changed indicating an update
    #then see if the new csv file requires formating
    def self.collect_csv_files
        for file in CSVFILES do
            download = URI.parse(URL + file).open
            
            if File.exist?(CSVDIR + file)
                next if File.size?(CSVDIR + file) === File.size?(download)
            end

            IO.copy_stream(download, CSVDIR + file)
            UbCSVFormatter.reformat(file)
        end
    end
end

UbCSVCollection.collect_csv_files