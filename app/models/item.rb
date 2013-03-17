class Item < ActiveRecord::Base
  attr_accessible :brand, :description, :name, :stolen, :image, :serial_number
  
  has_many :ownerships
  has_many :users, :through => :ownerships
  
  validates :brand, :description, :name, :presence => true
  validates :name, :length => { :minimum => 2 }
  validates :name, :uniqueness => true
  
  
  
  
  has_attached_file :image, styles: {
     thumb: '300x300>',
     square: '500x500>',
     medium: '800x800>'
  },
  :storage => :s3,
  :s3_credentials => "#{Rails.root}/config/s3.yml",
  :path =>"/assets/:user_id/:filename"
end
