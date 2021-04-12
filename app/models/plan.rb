class Plan < ApplicationRecord
    #コメント機能
    has_many :comments, dependent: :destroy

    #タグ機能
    acts_as_taggable

    #申し込み機能
    has_many :plan_users, dependent: :destroy
    has_many :takers, through: :plan_users, dependent: :destroy

    #ユーザーとの一体多アソシエーション
    belongs_to :user
end
