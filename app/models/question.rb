class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates_presence_of :title, :content

  has_reputation :votes, source: :user, aggregated_by: :sum

end
