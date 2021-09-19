class Article < ApplicationRecord
  has_many :comments
  belongs_to :user

  enum status: { published: 0, unpublished: 1, archived: 3 }
  
  validates :name, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
