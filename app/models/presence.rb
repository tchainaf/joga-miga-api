class Presence < ApplicationRecord
  belongs_to :user
  belongs_to :classes

  enum payment_type: [:monthly_subscription, :day_use, :make_up]

  validate :check_subscription
  validate :check_day_of_week

  def evaluate_payment_type!
    subscription = Subscription.where(user: user, classes: classes).first

    if subscription.present?
      if subscription.expires_at >= Date.today
        update(payment_type: :monthly_subscription)
      elsif subscription.available_make_up > 0
        subscription.update(available_make_up: subscription.available_make_up - 1)
        update(payment_type: :make_up)
      end
    else
      update(payment_type: :day_use)
    end
  end

  private

  def check_subscription
    subscription = Subscription.where(user: user, classes: classes).first
    invalid = subscription.present? && subscription.expires_at < Date.today && subscription.available_make_up == 0

    case payment_type.to_sym
    when :monthly_subscription
      errors.add(:base, 'Não há pagamento mensal dessa aluna para a turma.') if invalid
    when :make_up
      errors.add(:base, 'Não há reposição disponível dessa aluna para a turma.') if invalid
    end
  end

  def check_day_of_week
    ref_week_day = :monday
    case classes.week_day.to_sym
      when :segunda
        ref_week_day = :monday
      when :terca
        ref_week_day = :tuesday
      when :quarta
        ref_week_day = :wednesday
      when :quinta
        ref_week_day = :thursday
      when :sexta
        ref_week_day = :friday
      when :sabado
        ref_week_day = :saturday
      when :domingo
        ref_week_day = :sunday
    end
    errors.add(:base, 'A data deve ser um dia de aula da turma.') unless ref_week_day == date.wday
  end
end
