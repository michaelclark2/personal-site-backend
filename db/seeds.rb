require 'json'

seeds = JSON.parse(File.readlines('./db/seeds.json').join)

seeds['projects'].each do |project|
  Project.create project
end

seeds['blogs'].each do |blog|
  Blog.create blog
end

Projecttechno.create([
  {project_id: 1, techno_id: 1},
  {project_id: 1, techno_id: 2},
  {project_id: 1, techno_id: 3},
  {project_id: 1, techno_id: 5},
  {project_id: 2, techno_id: 1},
  {project_id: 2, techno_id: 2},
  {project_id: 2, techno_id: 3},
  {project_id: 2, techno_id: 4},
  {project_id: 2, techno_id: 6},
  {project_id: 2, techno_id: 10},
  {project_id: 3, techno_id: 1},
  {project_id: 3, techno_id: 2},
  {project_id: 3, techno_id: 3},
  {project_id: 3, techno_id: 4},
  {project_id: 3, techno_id: 6},
  {project_id: 3, techno_id: 10},
])