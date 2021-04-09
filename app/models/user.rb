class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable, :confirmable
    
    #follow機能のアソシエーション
    has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
    has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower
    
    #follow機能のメゾット
    def follow!(other_user)
      active_relationships.create!(followed_id: other_user.id)
    end
    def following?(other_user)
      active_relationships.find_by(followed_id: other_user.id)
    end
    def unfollow!(other_user)
      active_relationships.find_by(followed_id: other_user.id).destroy
    end

    validates :name, presence: true #追記
end
