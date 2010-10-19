require 'test_helper'

class InteractionTest < ActiveSupport::TestCase
  should_belong_to :team
  should_belong_to :user
  should_belong_to :role
end
