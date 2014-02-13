class Comment < ActiveRecord::Base

  belongs_to :post
  belongs_to :user
  has_many :votes, as: :votable

  validates :body, presence: true

  # def self.vote_count
  #      up_votes = Vote.where(direction: true).count
  #      down_votes = Vote.where(direction: false).count
  #      up_votes - down_votes
  # end

end
