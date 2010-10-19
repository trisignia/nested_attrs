require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  should_have_many :interactions
  should_have_many :users
  should_have_many :players

  context "A valid team" do
    setup do
      @team = Factory(:team)
    end

    should_change("Team count", :by => 1){ Team.count }

    context "with an added player" do
      setup do
        @team.players << Factory(:user)
        @team.reload
      end

      should_change("User count", :by => 1){ User.count }
      should_change("Interaction count", :by => 1){ Interaction.count }

      should "have a player" do
        assert_equal(1, @team.players.size)
        assert_equal(User.first, @team.players.first)
      end

      should "have an interaction with the role 'player'" do
        role = Role.find_by_name('player')
        assert_equal(1, @team.interactions.size)
        assert_equal(role, @team.interactions.first.role)
      end
    
    end
  
  end
end
