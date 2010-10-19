require 'test_helper'

class TeamsControllerTest < ActionController::TestCase

  context "POST :create" do
    setup do
      post :create,
           :team => Factory.attributes_for(:team)
    end

    should_change("Team count", :by => 1){ Team.count }
    should_respond_with :redirect
    should_redirect_to("team path"){ team_path(assigns(:team)) }
  end

  context "POST :create (with nested players)" do
    setup do
      post :create,
           :team => Factory.attributes_for(:team, :players_attributes => [Factory.attributes_for(:user)])
    end

    should_change("Team count", :by => 1){ Team.count }
    should_change("User count", :by => 1){ User.count }
    should_change("Interaction count", :by => 1){ Interaction.count }
    should_respond_with :redirect
    should_redirect_to("team path"){ team_path(assigns(:team)) }

    should "have added the user as the team's player" do
      role = Role.find_by_name('player')
      team = assigns(:team).reload

      assert_equal(1, team.players.size)
      assert_equal(User.first, team.players.first)
      assert_equal(role, Interaction.first.role)
    end
  end

end
