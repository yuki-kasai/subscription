class CreateAgreements < ActiveRecord::Migration[5.2]
  def change
    create_table :agreements do |t|
      t.integer :user_id
      t.string :service_name
      t.integer :price
      t.date :start_date
      t.date :end_date
      t.date :schedule_end_date
      t.date :schedule_end_date

      t.timestamps
    end
  end
end
