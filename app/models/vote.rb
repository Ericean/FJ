class Vote < ActiveRecord::Base
  belongs_to :admin
  belongs_to :image

  def voted? 
  	self.voted != 0
  end 
end
