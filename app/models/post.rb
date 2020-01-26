class Post < ApplicationRecord
  belongs_to :user
  has_many :nices, dependent: :destroy
  has_many :iine_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  def niced_by?(user)
    nices.where(user_id: user.id).exists?
  end

  def nice_user(user_id)
   nices.find_by(user_id: user_id)
  end

  def uniine(user)
    nices.find_by(user_id: user.id).destroy
  end
end
