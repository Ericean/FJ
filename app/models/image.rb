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
    	Image.where("page = ? ", self.page).where("line = ?", self.line).order("images.number")
    end

    def decided?
      self.flag==DECIDED
    end

    def pinned?
      self.flag!=UNDECIDED && self.flag != DECIDED
    end

    def pinned_id
      if pinned?
        self.flag- BASE
      else 
        0
      end
    end
    
    #get the final result
    def result 
      if pinned?
        self.candidates.find(pinned_id)
      else 
        self.candidates.order("candidates.votesum DESC").first
      end
    end

    #update image status
    def update_status(pin_action = false, pinned_id=0)
      if pin_action 
        self.flag= BASE + pinned_id
      else 
        sum=self.candidates.sum(:votesum)
        self.flag=((5*sum) >= (4*(Admin.count))) ? DECIDED : UNDECIDED
      end
      self.save
    end
end
