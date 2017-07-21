class ChallengeController < ApplicationController
  def complete
    @challenge = Challenge.find(params[:id])
    @challenge.update(completed: true)

  end
end
