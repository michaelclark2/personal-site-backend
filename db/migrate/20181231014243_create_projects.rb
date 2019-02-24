class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :desc
      t.string :github
      t.string :url
    end
  end
end
