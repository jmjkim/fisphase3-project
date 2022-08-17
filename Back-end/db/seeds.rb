puts "🌱 Seeding spices..."

# Seed Engine Department
EngineDepartment.create(
    name: "Western Sedan Engineering", 
    department_of_engine_type: "sedan", 
    contact: "Anderson Heimer 925-987-6543 ah123sedan@abc.com"
    )

EngineDepartment.create(
    name: "Western SUV Engineering",
    department_of_engine_type: "suv", 
    contact: "James Gilton 923-117-7535 jg123suv@abc.com"
    )

# Seed Engines
engine_layout = ["Inline", "Flat", "V"]
engine_cylinder = [4, 6, 8, 10]
boolean = [true, false]

12.times do
    Engine.create(
        department_id: 1,
        engine_type: "sedan",
        manufactured_engine_id: Faker::Alphanumeric.alphanumeric(number:8),
        associated_vehicle_vin: Faker::Vehicle.vin,
        engine_layout: "#{engine_layout.sample}#{engine_cylinder.sample}",
        camshaft_built: boolean.sample,
        piston_built: boolean.sample,
        flywheel_built: boolean.sample,
        connecting_rod_built: boolean.sample,
        crankshaft_built: boolean.sample,
        sump_built: boolean.sample,
        camshaft_drive_belt_built: boolean.sample,
        remark: ""
        )
end

12.times do 
    Engine.create(
        department_id: 2,
        engine_type: "suv",
        manufactured_engine_id: Faker::Alphanumeric.alphanumeric(number:8),
        associated_vehicle_vin: Faker::Vehicle.vin,
        engine_layout: "#{engine_layout.sample}#{engine_cylinder.sample}",
        camshaft_built: boolean.sample,
        piston_built: boolean.sample,
        flywheel_built: boolean.sample,
        connecting_rod_built: boolean.sample,
        crankshaft_built: boolean.sample,
        sump_built: boolean.sample,
        camshaft_drive_belt_built: boolean.sample,
        remark: ""
    )
end
puts "✅ Done seeding!"
