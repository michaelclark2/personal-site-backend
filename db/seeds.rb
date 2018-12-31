require 'json'

seeds = JSON.parse(File.readlines('./db/seeds.json').join)

seeds['projects'].each do |project|
  Project.create project
end

seeds['blogs'].each do |blog|
  Blog.create blog
end