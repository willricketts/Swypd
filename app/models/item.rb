class Item < ActiveRecord::Base
  attr_accessible :brand, :description, :name
  
  has_many :ownerships
  has_many :users, :through => :ownerships
end
