class CreateEngineDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :engine_departments do |t|
      t.string :department_of_engine_type
      t.string :name
    end
  end
end
