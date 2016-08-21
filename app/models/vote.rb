class Vote < ActiveRecord::Base
  belongs_to :admin
  belongs_to :image

  def voted? 
  	self.voted != 0
  end 

  def reset
  	self.voted=0
  	self.save
  end

end
