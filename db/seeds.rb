Admin.destroy_all
Image.destroy_all
Candidate.destroy_all
Vote.destroy_all

#seed admins table
Admin.create! [
{name: "admin", password:"admin"},
{name: "Ze Gao", password: "abc123"},
{name: "Tina", password:"123abc"}
]



#seed images table
5.times do |index|
	Image.create! [{url: "img#{index}"}]
end

#seed candidates table
img=Image.find_by url: "img0"


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



#seed votes table
users= Admin.all
imgs= Image.all
users.each do |user|
	imgs.each do |img|
		vote = user.votes.new(admin:user, image:img)
		vote.save!
	end
end



