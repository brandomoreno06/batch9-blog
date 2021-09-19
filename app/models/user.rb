class User < ApplicationRecord
    has_secure_password

    has_many :articles

    validates :first_name, presence: true, length: { minimum: 2 }
    validates :last_name, presence: true, length: { minimum: 2 }
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
end
