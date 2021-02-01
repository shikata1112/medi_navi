class ClinicHistory < ApplicationRecord
  belongs_to :clinic
  belongs_to :member

  delegate :name, :address, :review_scores, :reviews_size, to: :clinic, prefix: true

  def self.create_and_destroy_history(current_member, clinic_id)
    create_new_history(current_member, clinic_id)
    destroy_old_history(current_member)
  end

  def self.create_new_history(current_member, clinic_id)
    new_history = new
    new_history.member_id = current_member.id

    if current_member.clinic_histories.unscope(where: :clinic_id).any?{ |clinic_history| clinic_history.clinic_id == clinic_id }
      old_history = current_member.clinic_histories.find_by(clinic_id: clinic_id)
      old_history.destroy
    end
    new_history.save
  end

  def self.destroy_old_history(current_member)
    histories_stock_limit = 3
    histories = current_member.clinic_histories.unscope(where: :clinic_id).all
    histories[0].destroy if histories.count > histories_stock_limit
  end

end
