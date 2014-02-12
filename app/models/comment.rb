class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user
  has_many :votes, as: :votable

  validates :body, presence: true

  def vote_count
       up_votes = votes.where(direction: true).count
       down_votes = votes.where(direction: false).count
       up_votes - down_votes
  end

end
