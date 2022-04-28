class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :classes
  has_many :payments

  enum status: [:active, :inactive]
end
