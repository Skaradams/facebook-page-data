class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :fb_id
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
