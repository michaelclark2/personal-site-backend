class CreateTechsCreateProjecttechs < ActiveRecord::Migration[5.2]
  def change
    create_table :technos do |t|
      t.string :name
    end

    create_table :projecttechnos do |t|
      t.belongs_to :project
      t.belongs_to :techno
    end


  end
end
