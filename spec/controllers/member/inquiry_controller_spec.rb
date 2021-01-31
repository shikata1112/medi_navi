require 'rails_helper'

RSpec.describe Member::InquiryController, type: :controller do
  before do
    @member = create(:member)
    sign_in @member
  end

  describe "new" do
    it "/member/inquiry/newにアクセスできること" do
      get :new
      expect(response).to have_http_status(200)
    end
  end
  
  describe "confirm" do
    context "入力した値が正常であるとき" do
      let(:params) do
        {
          inquiry: {
            title: 'test',
            content: 'testです',
            member_id: @member.id
          }
        }
      end

      it "/member/inquiry/confirmにアクセスできること" do
        post :confirm, params: params
        expect(response).to have_http_status(200)
      end
    end

    context "入力した値が正常でないとき" do
      let(:params) do
        {
          inquiry: {
            title: 'test',
            content: nil,
            member_id: @member.id
          }
        }
      end

      it "newページがレンダリングされること" do
        post :confirm, params: params
        expect(response).to render_template :new
      end
    end
  end

  describe "create" do
    context "入力した値が正常なとき" do
      let(:params) do
        {
          inquiry: {
            title: 'test',
            content: 'testです',
            member_id: @member.id
          }
        }
      end

      it "問い合わせを保存できるか" do
        post :create, params: params
        expect(@member.inquiries.size).to eq (1)
      end

      it "/member/inquiry/thanksにリダイレクトすること" do
        post :create, params: params
        expect(response).to redirect_to "/member/inquiry/thanks"
      end
    end

    context "入力した値が正常でないとき" do
      let(:params) do
      {
        inquiry: {
          title: nil,
          content: 'testです',
          member_id: @member.id
        }
      }
      end

      it "flashメッセージを表示すること" do
        post :create, params: params
        expect(flash[:danger]).to be_present
      end

      it "newページがレンダリングされること" do
        post :create, params: params
        expect(response).to render_template :new
      end
    end
  end

  describe "thanks" do
    it "/member/inquiry/thanksにアクセスできること" do
      get :thanks
      expect(response).to have_http_status(200)
    end
  end
end
