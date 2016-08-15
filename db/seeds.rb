# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.destroy_all
Image.destroy_all
Candidate.destroy_all


Admin.create! [
{name: "Ze Gao", password: "abc123"},
{name: "Tina", password:"123abc"}
]

ze= Admin.find_by(name:"Ze Gao")
tina= Admin.find_by(name:"Tina")

5.times do |index|
	img =Image.new(url: "img#{index}")
	img.save!
	vote =ze.votes.new(admin:ze, image:img)
	vote.save!
	vote =tina.votes.new(admin:tina, image:img)
	vote.save!
end

img=Image.find_by url: "img0"
img.flag=true
img.save!

img.candidates.create! [
{content: "藏"},
{content: "臧"},
{content: "臟"}
]

img1= Image.find_by url: "img1"
img1.candidates.create! [
{content: "宗"},
{content: "崇"},
]
