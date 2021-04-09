class Comment < ApplicationRecord
  belongs_to :plan
  validates :content, presence: true
end
