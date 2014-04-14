module ApplicationHelper
  def vote_count(votable)
    post_found = Post.find(votable.id)
    comment_found_method(post_found)
  end

  def vote_count_comment(votable)
    comment_found = Comment.find(votable.id)
    comment_found_method(comment_found)
  end

  def comment_found_method(found)
    found.votes.where(direction: true).count - found.votes.where(direction: false).count
  end

end
