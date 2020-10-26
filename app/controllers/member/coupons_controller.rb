class Member::CouponsController < ApplicationController
  before_action :authenticate_member!

  def index
    @coupons = Coupon.where(member_id: current_member.id, is_valid: '有効')
  end

  def destroy
    @coupon = Coupon.find_by(member_id: current_member.id, is_valid: '有効')
    @coupon.destroy
    redirect_to member_coupons_path
  end

end
