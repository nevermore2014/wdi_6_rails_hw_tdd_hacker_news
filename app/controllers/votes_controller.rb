class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_action :set_votable # Gives us @votable on all actions


  def new
    @vote = Vote.new
  end


  def create
    @vote = @votable.votes.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to [@votable, @vote], notice: 'Vote was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to [@votable, @vote], notice: 'vote was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end


  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to [@votable, :votes] }

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    def set_votable
      @votable = params[:votable].classify.constantize.find(votable_id)
    end

    def votable_id
      params[(params[:votable] + "_id").to_sym]
    end

    def vote_params
      params.require(:vote).permit(:direction)
    end
end
