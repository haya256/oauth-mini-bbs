class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :uid, presence: true, uniqueness: { scope: :provider }

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid)
  end

  def display_name
    "User ##{id}"
  end
end
