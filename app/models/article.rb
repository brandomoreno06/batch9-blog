class Article < ApplicationRecord

    validates :name, presence: true
    validates :body, length: { minimum: 3 }
end
