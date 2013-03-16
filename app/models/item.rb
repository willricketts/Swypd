class Item < ActiveRecord::Base
  attr_accessible :brand, :description, :name, :stolen
  
  has_many :ownerships
  has_many :users, :through => :ownerships
  
  validates :brand, :description, :name, :presence => true
  validates :name, :length => { :minimum => 2 }
  validates :name, :uniqueness => true
end
