class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :overview
      t.string :live_url
      t.string :codebase
      t.string :environment
      t.text :description
      t.string :based_on

      t.timestamps
    end
  end
end
