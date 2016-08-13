# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Image.destroy_all
10.times do |index|
	Image.create! [{name:"img_#{index}", url: "img#{index}"}]
end

img=Image.find_by name: "img_0"
img.candidates.create! [
{content: "功"},
{content: "切"}

]