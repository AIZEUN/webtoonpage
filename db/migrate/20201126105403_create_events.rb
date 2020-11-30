class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :structure

      t.timestamps
    end
  end
end
