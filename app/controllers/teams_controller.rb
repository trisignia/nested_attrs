class TeamsController < ApplicationController

  def new
    @team = Team.new 
    @team.players.build
  end

  def create
    @team = Team.new(params[:team])
    if @team.save
      redirect_to team_path(@team)
    else
      render :action => 'new'
    end
  end

  def show
    @team = Team.find(params[:id], :include => :players)
  end

  def edit
    @team = Team.find(params[:id], :include => :players)
    @team.players.build
  end

  def update
    @team = Team.find(params[:id])

    if @team.update_attributes(params[:team])
      redirect_to team_path(@team)
    else
      render :action => 'edit'
    end
  end
end
