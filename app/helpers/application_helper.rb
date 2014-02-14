module ApplicationHelper
  def vote_count(votable)
    post_found = Post.find(votable.id)
    post_found.votes.where(direction: true).count - post_found.votes.where(direction: false).count
    # up_votes = Vote.where(direction: true).count
    # down_votes = Vote.where(direction: false).count
    # up_votes - down_votes
  end

  def vote_count_comment(votable)
    comment_found = Comment.find(votable.id)
    comment_found.votes.where(direction: true).count - comment_found.votes.where(direction: false).count
  end

  def decay(post)
    post = Post.find(post.id)
    (Time.now - post.created_at)/86400
  end
end
