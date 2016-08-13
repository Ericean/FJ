class Image < ActiveRecord::Base
  belongs_to :admin
  has_many :candidates, dependent: :destroy
  
  def previous
      Image.where(" id < ?",  self.id).last
  end
  
  def next
      Image.where(" id > ?",  self.id).first
  end
end
