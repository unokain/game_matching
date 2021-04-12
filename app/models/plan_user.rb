class PlanUser < ApplicationRecord
    #userをtakerに紐付け
    belongs_to :taker, class_name: 'User', foreign_key: 'taker_id'
    validates_uniqueness_of :plan_id, scope: :taker_id
end
