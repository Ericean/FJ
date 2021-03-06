ActiveRecord::Base.transaction do
	Admin.destroy_all
	Image.destroy_all
	Candidate.destroy_all
	Vote.destroy_all
end
#seed admins table
ActiveRecord::Base.transaction do
	Dir["#{Rails.root.join("extra/users")}/*"].each do |f|
		next unless File.file?(f) 
		File.open f do |file|
			file.each do |record|
				user, passwd = record.chomp.split(',').map(&:strip)
				Admin.create! [{name: user, password: passwd}]
			end
		end
	end
end

# #seed images tabl e & candidates
ActiveRecord::Base.transaction do
	Dir["#{Rails.root.join("extra/candidates")}/*"].each do |f|
		next unless File.file?(f) 
		File.open f do |file|
			file.each do |record|
				url, cans = record.chomp.split(',').map(&:strip)
				#seed images table
				page = url[0..-6]
				line, number = url[-5..-1].split(/L/).map(&:strip)
				image= Image.new(url: url, page: page, line: line.to_i, number: number.to_i)
				image.save

				#seed candidates
				candidates= cans.split(" ").map(&:strip) unless cans.nil?
				unless candidates.nil?
					candidates.each { |e| image.candidates.create! [{content:e}] }
				end
			end
		end
	end
end



