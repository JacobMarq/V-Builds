# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
typical_usages = TypicalUsage.create([{ title: "Gamer",
                                        description: "High performance / High FPS",
                                        gpu_precedent: 1,
                                        cpu_precedent: 1,
                                        ram_size_suggestion: 16},
                                    { title: "General User",
                                        description: "Light office work / Casual entertainment",
                                        gpu_precedent: 0,
                                        cpu_precedent: 0,
                                        ram_size_suggestion: 16},
                                    { title: "Video editor",
                                        description: "Processor Heavy / High memory usage",
                                        gpu_precedent: 0,
                                        cpu_precedent: 1,
                                        ram_size_suggestion: 32},
                                    { title: "3D Modeler",
                                        description: "Overall performance / High memory usage",
                                        gpu_precedent: 1,
                                        cpu_precedent: 1,
                                        ram_size_suggestion: 32}])
types = Type.create([{ name: 'GPU' },
                    { name: 'CPU' },
                    { name: 'RAM' },
                    { name: 'MOBO' },
                    { name: 'HDD' },
                    { name: 'SSD' },
                    { name: 'CASE' },
                    { name: 'COOLING CPU' },
                    { name: 'COOLING CASE' }])
specifications = Specification.create([{ name: 'Memory Type' }, #GPU RAM CPU MOBO
                            { name: 'Memory Size' }, #GPU RAM
                            { name: 'Boost Clock' }, #GPU
                            { name: 'CUDA Cores' }, #GPU
                            { name: 'Base Clock' }, #GPU
                            { name: 'Power Wattage' }, #GPU CPU
                            { name: 'Required System Power' }, #GPU CPU
                            { name: 'Display Connectors' }, #GPU
                            { name: 'Slot' }, #GPU
                            { name: 'Cores' }, #CPU
                            { name: 'Threads' }, #CPU
                            { name: 'Code Name' }, #CPU
                            { name: 'Max Turbo Frequency'}, #CPU
                            { name: 'Base Frequency' }, #CPU
                            { name: 'Cache' }, #CPU
                            { name: 'Bus Speed' }, #CPU
                            { name: 'TDP' }, #CPU
                            { name: 'Max Memory Size' }, #CPU
                            { name: 'ECC Support' }, #CPU RAM
                            { name: 'CAS Latency' }, #RAM
                            { name: 'Voltage' }, #RAM
                            { name: 'Speed' }, #RAM
                            { name: 'Socket' }, #CPU MOBO
                            { name: 'Water Cooling' }, #COOLING_CPU
                            { name: 'Air Cooling' }, #COOLING_CPU
                            { name: 'Size' }, #COOLING_CPU #COOLING_CASE
                            { name: 'RGB' }, #COOLING_CASE
                            { name: 'Noise Level'},]) #COOLING_CASE
type_specifications = TypeSpecification.create([{ type_id: types[0].id, specification_id: specifications[0].id },
                                        { type_id: types[0].id, specification_id: specifications[1].id },
                                        { type_id: types[0].id, specification_id: specifications[2].id },
                                        { type_id: types[0].id, specification_id: specifications[3].id },
                                        { type_id: types[0].id, specification_id: specifications[4].id },
                                        { type_id: types[0].id, specification_id: specifications[5].id },
                                        { type_id: types[0].id, specification_id: specifications[6].id },
                                        { type_id: types[0].id, specification_id: specifications[7].id },
                                        { type_id: types[0].id, specification_id: specifications[8].id },
                                        { type_id: types[1].id, specification_id: specifications[0].id },
                                        { type_id: types[1].id, specification_id: specifications[5].id },
                                        { type_id: types[1].id, specification_id: specifications[6].id },
                                        { type_id: types[1].id, specification_id: specifications[9].id },
                                        { type_id: types[1].id, specification_id: specifications[10].id },
                                        { type_id: types[1].id, specification_id: specifications[11].id },
                                        { type_id: types[1].id, specification_id: specifications[12].id },
                                        { type_id: types[1].id, specification_id: specifications[13].id },
                                        { type_id: types[1].id, specification_id: specifications[14].id },
                                        { type_id: types[1].id, specification_id: specifications[15].id },
                                        { type_id: types[1].id, specification_id: specifications[16].id },
                                        { type_id: types[1].id, specification_id: specifications[17].id },
                                        { type_id: types[1].id, specification_id: specifications[18].id },
                                        { type_id: types[1].id, specification_id: specifications[22].id },
                                        { type_id: types[2].id, specification_id: specifications[0].id },
                                        { type_id: types[2].id, specification_id: specifications[1].id },
                                        { type_id: types[2].id, specification_id: specifications[18].id },
                                        { type_id: types[2].id, specification_id: specifications[19].id },
                                        { type_id: types[2].id, specification_id: specifications[20].id },
                                        { type_id: types[2].id, specification_id: specifications[21].id },
                                        { type_id: types[3].id, specification_id: specifications[0].id },
                                        { type_id: types[3].id, specification_id: specifications[22].id },
                                        { type_id: types[7].id, specification_id: specifications[23].id },
                                        { type_id: types[7].id, specification_id: specifications[24].id },
                                        { type_id: types[7].id, specification_id: specifications[25].id },
                                        { type_id: types[8].id, specification_id: specifications[25].id },
                                        { type_id: types[8].id, specification_id: specifications[26].id },
                                        { type_id: types[8].id, specification_id: specifications[27].id },])
options = Option.create([{ value: 'yes' }, #RGB ECC_Support Air_Cooling Water_Cooling
                        { value: 'no' }, #RGB ECC_Support Air_Cooling Water_Cooling
                        { value: '1gb' }, #Memory_Size
                        { value: '2gb' }, #Memory_Size
                        { value: '4gb' }, #Memory_Size
                        { value: '6gb' }, #Memory_Size
                        { value: '8gb' }, #Memory_Size
                        { value: '10gb' }, #Memory_Size
                        { value: '12gb' }, #Memory_Size
                        { value: '14gb' }, #Memory_Size
                        { value: '16gb' }, #Memory_Size
                        { value: '32gb' }, #Memory_Size
                        { value: '64gb' }, #Memory_Size
                        { value: '128gb' }, #Memory_Size
                        { value: '120mm' }, #Size
                        { value: '140mm' }, #Size 
                        { value: '240mm' }, #Size
                        { value: '360mm' }, #Size
                        { value: 'DDR3' }, #Memory_Type
                        { value: 'DDR4' }, #Memory_Type
                        { value: 'DDR5'}, #Memory_Type
                        { value: 'DDR6' },]) #Memory_Type
specification_options = SpecificationOption.create([{ specification_id: specifications[0].id, option_id: options[18].id },
                                            { specification_id: specifications[0].id, option_id: options[19].id },
                                            { specification_id: specifications[0].id, option_id: options[20].id },
                                            { specification_id: specifications[0].id, option_id: options[21].id },
                                            { specification_id: specifications[24].id, option_id: options[17].id },
                                            { specification_id: specifications[24].id, option_id: options[16].id },
                                            { specification_id: specifications[24].id, option_id: options[15].id },
                                            { specification_id: specifications[24].id, option_id: options[14].id },])
