class User < ApplicationRecord
  has_many :questions
validates :username, uniqueness: true, presence: true
end
