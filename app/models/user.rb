class User < ActiveRecord::Base
  has_many :interactions
  has_many :roles, :through => :interactions
  has_many :teams, :through => :interactions
end
