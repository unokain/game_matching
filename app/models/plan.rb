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
    validates :content, presence: true, length: { in: 1..500 }
    validates :title,  presence: true, length: { maximum: 30 }
    validates :start_time, presence: true
    validates :limit_time, presence: true
    validate :start_limit_check
    validate :start_check

    #検索用メゾット
    scope :plans_search, ->(n){where('title LIKE(?)', "%#{n}%")}
    scope :sort_start, -> { order(limit_time: :asc) }

    def start_limit_check
        errors.add(:limit_time, "は開始時刻より遅い時間を選択してください") if self.start_time > self.limit_time
    end

    def start_check
        errors.add(:start_time, "は現在の日時より遅い時間を選択してください") if self.start_time < Time.now
    end
end
