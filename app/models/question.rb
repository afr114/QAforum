class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  validates_presence_of :title, :content


  # searching
  def self.search(query)
    where("title like ?", "%#{query}%")
  end

end
