Admin.destroy_all
Image.destroy_all
Candidate.destroy_all
Vote.destroy_all

#seed admins table
Dir["#{Rails.root.join("extra/users")}/*"].each do |f|
	next unless File.file?(f) 
	File.open f do |file|
		file.each do |record|
			user, passwd = record.chomp.split(',').map(&:strip)
			Admin.create! [{name: user, password: passwd}]
		end
	end
	
end

# #seed images tabl e & candidates

Dir["#{Rails.root.join("extra/candidates")}/*"].each do |f|
	next unless File.file?(f) 
	File.open f do |file|
		file.each do |record|
			url, cans = record.chomp.split(',').map(&:strip)
			#seed images table
			line, number = url[-5..-1].split(/L/).map(&:strip)
			image= Image.new(url: url, line: line.to_i, number: number.to_i)
			image.save

			#seed candidates
			candidates= cans.split(" ").map(&:strip) unless cans.nil?
			unless candidates.nil?
				candidates.each { |e| image.candidates.create! [{content:e}] }
			end
		end
	end
	
end




