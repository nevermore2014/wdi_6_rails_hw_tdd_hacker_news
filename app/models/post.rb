class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable

  validates :title, presence: true
  validates :body, presence: true


  def vote_count
       up_votes = votes.where(direction: true).count
       down_votes = votes.where(direction: false).count
       up_votes - down_votes
  end 

end
