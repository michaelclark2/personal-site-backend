class AddInitialTechs < ActiveRecord::Migration[5.2]
  def up
    Techno.create(name: "HTML")
    Techno.create(name: "CSS")
    Techno.create(name: "JavaScript")
    Techno.create(name: "React")
    Techno.create(name: "jQuery")
    Techno.create(name: "Bootstrap")
    Techno.create(name: "React Native")
    Techno.create(name: "Ionic Cordova")
    Techno.create(name: "ASP.NET")
    Techno.create(name: "Firebase")
    Techno.create(name: "Microsoft Azure")
    Techno.create(name: "C#")
    Techno.create(name: "Dapper")
    Techno.create(name: "Bulma")
    Techno.create(name: "Angular")
  end
  def down
    Techno.destroy.all
  end
end
