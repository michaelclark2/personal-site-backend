require 'json'

seeds = JSON.parse(File.readlines('./db/seeds.json').join)

seeds['projects'].each do |project|
  Project.create project
end

seeds['blogs'].each do |blog|
  Blog.create blog
end

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

Projecttechno.create(project_id: 1, techno_id: 1)
