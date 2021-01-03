class Coupon < ApplicationRecord
  belongs_to :member

  enum is_valid: { '有効': true, '無効': false }

  def self.coupon_destroy
    time = Time.now
    coupons = Coupon.all 
    coupons.each do |coupon|
      if coupon.expiration_date < time && coupon.is_valid == '有効'
        coupon.is_valid = '無効'
        coupon.save
      end
    end
  end

  def ja_expiration_date
    expiration_date.to_s(:datetime_jp)
  end

  private

  def expiration_date
    created_at + limit.minutes
  end
  
end
