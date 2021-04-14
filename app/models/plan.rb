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

    #バリテーション
    validates :content, presence: true, length: { in: 1..300 }
    validates :title,  presence: true, length: { maximum: 30 }
    validates :start_time, presence: true
    validates :limit_time, presence: true

    #検索用メゾット
    scope :plans_search, ->(n){where('title LIKE(?)', "%#{n}%")}
end
