class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :person, index: true
      t.string :title
      t.string :description
      t.text :bio
      t.string :twitter
      t.string :github

      t.timestamps
    end
  end
end
