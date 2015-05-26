class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.belongs_to :doctor
      t.belongs_to :user
      t.date :date
    end
  end
end
