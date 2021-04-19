class Comment < ApplicationRecord
  belongs_to :plan
  belongs_to :user
  validates :content, presence: true
end
