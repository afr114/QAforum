class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of   :name, :email
  validates_uniqueness_of :email
  validates :email, format: { with: VALID_EMAIL_REGEX }

  has_secure_password
  has_many :questions

  has_many :evaluations, class_name: "RSEvaluation", as: :source

  has_reputation :votes, source: {reputation: :votes, of: :questions}, aggregated_by: :sum
  

  def voted_for?(question)
    evaluations.where(target_type: question.class, target_id: question.id).present?
  end
end
