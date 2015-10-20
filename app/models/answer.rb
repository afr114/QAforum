class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

  validates_presence_of :content

  has_reputation :votes, source: :user, aggregated_by: :sum
  
end
