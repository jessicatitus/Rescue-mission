class Question < ApplicationRecord
belongs_to :user
has_many :answers
delegate :username, to: :user

validates :title, length: {minimum: 20}
validates :description, length: {minimum: 50}
end
