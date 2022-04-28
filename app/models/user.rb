class User < ApplicationRecord
  has_many :subscriptions
  has_many :presences
  has_many :payments

  enum role: [:user, :admin]
  enum status: [:active, :inactive]
end
