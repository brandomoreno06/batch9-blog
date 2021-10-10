class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :image, dependent: :destroy
  has_rich_text :body

  enum status: { published: 0, unpublished: 1, archived: 3 }
  
  validates :name, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
