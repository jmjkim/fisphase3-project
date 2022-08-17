class ApplicationController < Sinatra::Base
    # Engine Department Controller -> Create, Read
    set :default_content_type, 'application/json'

    get "/departments" do
      departments = EngineDepartment.all
      departments.to_json
    end

    get "/departments/:id" do
      department = EngineDepartment.all.find(params[:id])
      department.to_json
    end

    post "/departments" do
      check_department = EngineDepartment.exists?(:id => params[:department_id])

      unless check_department === true
        new_department = EngineDepartment.create(name: params[:name], department_of_engine_type: params[:department_of_engine_type], contact: params[:contact])
        new_department.to_json
      else
        puts "Department already exists" 
      end
    end

    delete "/departments/:id" do
      EngineDepartment.find(params[:id]).destroy
    end


    # Engine Controller -> CRUD
    get "/departments/engines" do
      engines = Engine.all
      engines.to_json
    end

    get "/departments/:id/engines" do
      engines = Engine.all.where(department_id: params[:id])
      engines.to_json
    end

    post "/departments/:id/engines" do
      new_engine = Engine.create(
        department_id: params[:id],
        engine_type: params[:engine_type], 
        manufactured_engine_id: Faker::Alphanumeric.alphanumeric(number:8), 
        associated_vehicle_vin: Faker::Vehicle.vin, 
        engine_layout: params[:engine_layout], 
        remark: params[:remark]
        )

      new_engine.to_json
    end

    patch "/departments/engines/:manufactured_engine_id" do
      updating_engine = Engine.all.find_by(manufactured_engine_id: params[:manufactured_engine_id])

      updating_engine.update(
        engine_type: params[:engine_type], 
        manufactured_engine_id: params[:manufactured_engine_id],
        associated_vehicle_vin: params[:associated_vehicle_vin],
        engine_layout: params[:engine_layout],
        camshaft_built: params[:camshaft_built],
        piston_built: params[:piston_built],
        flywheel_built: params[:flywheel_built],
        connecting_rod_built: params[:connecting_rod_built],
        crankshaft_built: params[:crankshaft_built],
        sump_built: params[:sump_built],
        camshaft_drive_belt_built: params[:camshaft_drive_belt_built],
        remark: params[:remark]
        )

      updating_engine.to_json
    end

    delete "/departments/engines/:manufactured_engine_id" do
      deleting_engine = Engine.all.find_by(manufactured_engine_id: params[:manufactured_engine_id])

      deleting_engine.destroy
    end
end