class Coupon < ApplicationRecord
  belongs_to :member

  def self.destroy!
    Coupon.all.each do |coupon|
      coupon.destroy! if coupon.expired?
    end
  end

  def ja_expiration_date
    expiration_date.to_s(:datetime_jp)
  end

  private

  def expired?
    expiration_date < Time.now
  end

  def expiration_date
    created_at + limit.minutes
  end
  
end
