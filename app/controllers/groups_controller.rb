class GroupsController < ApplicationController
  before_action :set_group
  def award
    @merit = Merit.random
    @award = Award.create(group: @group, merit: @merit)

    @group.update_score!
  end

  def show
  end

  private
  def set_group
    @group = Group.find(params[:id])
  end
end
