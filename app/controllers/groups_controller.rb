class GroupsController < ApplicationController
  def award
    @merit = Merit.random
    @group = Group.find(params[:id])
    @award = Award.create(group: @group, merit: @merit)

    @group.update_score!
  end
end
