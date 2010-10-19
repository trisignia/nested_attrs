class Role < ActiveRecord::Base
  has_many :interactions
  has_many :users, :through => :interactions
end
