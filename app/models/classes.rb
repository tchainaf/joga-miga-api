class Classes < ApplicationRecord
  has_many :subscriptions
  has_many :presences

  enum status: [:active, :inactive]

  def add_subscription_payment!(subscription = nil)
    if subscription.nil?
      subscription = subscriptions.where(user: user).first
      errors.add(:base, 'Não há inscrição dessa aluna para a turma.') and return unless subscription.present?
    end

    subscription.payment.create!(user: user, amount: monthly_fee, date: Date.today)
    subscription.update(expires_at: Date.today + 1.month) #expires_at + 1.month?
  end
end
