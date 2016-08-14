class Image < ActiveRecord::Base
	has_many :candidates
	has_many :votes
	has_many :admins, :through => :votes

	def previous
      Image.where(" id < ?",  self.id).last
    end
  
    def next
      Image.where(" id > ?",  self.id).first
    end

end
