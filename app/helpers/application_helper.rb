module ApplicationHelper
  def vote_count(votable)
    post_found = Post.find(votable.id)
    post_found.votes.where(direction: true).count - post_found.votes.where(direction: false).count
    # up_votes = Vote.where(direction: true).count
    # down_votes = Vote.where(direction: false).count
    # up_votes - down_votes
  end
end
