class Image < ActiveRecord::Base
  UNDECIDED=0
  DECIDED=1
  BASE=2
	has_many :candidates
	has_many :votes
	has_many :admins, :through => :votes

	def previous
      Image.where(" id < ?",  self.id).last
    end
  
    def next
      Image.where(" id > ?",  self.id).first
    end
    
    def get_context
    	Image.where("line = ?", self.line).order("images.number")
    end

    def decided?
      self.flag==DECIDED
    end

    def pinned?
      self.flag!=UNDECIDED && self.flag != DECIDED
    end

    #get the final result
    def result 
       self.candidates.order("candidates.votesum DESC").first.content
    end

    #update image status
    def update_status
      sum=self.candidates.sum(:votesum)
      self.flag=((5*sum) >= (4*(Admin.count))) ? DECIDED : UNDECIDED
      self.save 
    end

end
