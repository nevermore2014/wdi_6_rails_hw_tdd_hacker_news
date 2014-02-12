class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, as: :votable

  validates :title, presence: true
  validates :body, presence: true

  def vote_count
    count = 0
    self.votable.each do |vote|
      if vote.direction == true
        count += 1
      end
    count
  end

end
