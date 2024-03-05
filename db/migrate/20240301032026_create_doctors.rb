class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialization
      t.decimal :cost
      t.string :image_url

      t.timestamps
    end
  end
end
