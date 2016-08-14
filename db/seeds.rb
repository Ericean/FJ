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
{name: "Ze Gao", password: "abc123"}
]
admin= Admin.find_by name: "Ze Gao"

30.times do |index|
	admin.images.create! [url: "img#{index}"]
end

img=Image.find_by url: "img0"
img.candidates.create! [
{content: "功"},
{content: "切"}

]