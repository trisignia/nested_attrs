require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should_have_many :interactions
  should_have_many :roles
  should_have_many :teams
end
