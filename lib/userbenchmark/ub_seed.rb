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
            @type = Type.find_by! name: @table[1]["Type"]
            @spec_list = Specification.where(name: ['Memory Type', 'Memory Size', 'CAS Latency', 'Speed'])
            
            @table.each {|row|
                @component = Component.create({
                    part_number: row['Part Number'],
                    brand: row['Brand'],
                    model: row['Model'],
                    type_id: @type.id})
                
                create_component_resource(row)
                create_component_specs(row) if row.length > 8
            }
        end

        def create_component_resource(row)
            ComponentResource.create({
                component_id: @component.id,
                ub_rank: row['Rank'],
                ub_benchmark: row['Benchmark'],
                ub_samples: row['Samples'],
                ub_link: row['URL']
            })
        end
        
        def create_component_specs(row)
            for spec in @spec_list do
                if row[spec.name]
                    opt_value = row[spec.name]
                    add_component_spec(spec, opt_value)
                end
            end
        end

        def add_component_spec(spec, opt_value)
            opt = Option.find_by({value: opt_value})
            if opt.nil?
                opt = Option.create({value: opt_value})
                SpecificationOption.create({specification_id: spec.id, option_id: opt.id})
            end
            puts(opt.value)
            spec_opt = SpecificationOption.find_by!({specification_id: spec.id, option_id: opt.id})

            ComponentSpecification.create({component_id: @component.id, specification_option_id: spec_opt.id})
        end
    end
end