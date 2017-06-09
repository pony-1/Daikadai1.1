class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
       t.string :title
      t.text :content


      t.timestamps null: false
    end
  end
end
