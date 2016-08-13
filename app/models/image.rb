class Image < ActiveRecord::Base
  belongs_to :admin
  has_many :candidates, dependent: :destroy
end
