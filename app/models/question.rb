class Question < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :content


  # searching
  def self.search(query)
    where("title like ?", "%#{query}%")
  end

end
