class Plan < ApplicationRecord
    has_many :comments, dependent: :destroy
end
