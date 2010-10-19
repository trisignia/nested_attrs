require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  should_have_many :interactions
  should_have_many :users
end
