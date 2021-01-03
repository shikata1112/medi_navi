class Coupon < ApplicationRecord
  belongs_to :member

  enum is_valid: { '有効': true, '無効': false }
  # TODO: 修正

  def self.coupon_destroy
    coupons = Coupon.all 
    coupons.each do |coupon|
      if coupon.expired? && coupon.is_valid == '有効'
        coupon.is_valid = '無効'
        coupon.save
      end
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
