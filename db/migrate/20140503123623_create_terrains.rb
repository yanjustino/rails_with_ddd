class CreateTerrains < ActiveRecord::Migration
  def change
    create_table :terrains do |t|
      t.string :street
      t.float  :width
      t.float  :height
      t.string :street
      t.string :number
      t.string :district
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :transaction
      t.string :state
      t.decimal :value
      t.decimal :quota
      t.integer :number_quote
      t.string  :type
      t.decimal :condominium_tax
      t.string  :condominium
      t.decimal :iptu
      t.string  :public_documentation
      t.string  :private_documentation
      t.string  :other_documentation
      t.string  :terms_documentation
      t.text    :observation


      t.timestamps
    end
  end
end
