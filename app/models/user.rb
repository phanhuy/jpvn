class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_logs, dependent: :destroy
  has_many :study_logs, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :tests, dependent: :destroy
  has_many :user_answers, through: :tests
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :study_logs
  
  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end
  
  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  
  # Returns true ig the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
  
  def status_with friend_id
    if friend = Friend.where(user_id: self.id, friend_id: friend_id).try(:first)
      if friend.accepted
        :be_accepted
      else
        :requested
      end
    elsif friend = Friend.where(user_id: friend_id, friend_id: self.id).try(:first)
      if friend.accepted
        :accepted
      else
        :be_requested
      end
    else
      :nothing
    end
  end
  
  def friends
    Friend.where("user_id = ? or friend_id = ?", self.id, self.id)
  end

  def self.search(query)
    where("name or email like ?", "%#{query}%") 
  end
  
  def feed
    friend_ids = "SELECT friend_id FROM friends
                     WHERE  user_id = :user_id"
    StudyLog.where("user_id IN (#{friend_ids}) OR user_id = :user_id", user_id: id)
  end
  
end
