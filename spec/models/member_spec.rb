require 'rails_helper'

RSpec.describe Member, type: :model do

  before do
    @member = FactoryBot.build(:member)
  end

  describe "新規会員登録" do
    
    context "入力内容が空でないこと" do
      it "会員情報が正しく登録できること" do
        expect(@member).to be_valid
      end 
    end
    
    context "バリデーションの有効性" do
      it "nameが空の場合は登録できないこと" do
        @member.name = " "
        expect(@member).to be_invalid
      end

      it "emailが空の場合は登録できないこと" do
        @member.email = " "
        expect(@member).to be_invalid
      end

      it "postcodeが整数でない場合は登録できないこと" do
        @member.postcode = "a" * 7
        expect(@member).to be_invalid
      end

      it "postcodeが7文字でない場合は登録できないこと" do
        @member.postcode = "123"
        expect(@member).to be_invalid
      end

      it "addressが空の場合は登録できないこと" do
        @member.address = " "
        expect(@member).to be_invalid
      end

      it "birthdayが空の場合は登録できないこと" do
        @member.birthday = " "
        expect(@member).to be_invalid
      end

      it "prefecture_codeが空の場合は登録できないこと" do
        @member.prefecture_code = " "
        expect(@member).to be_invalid
      end

      it "is_deletedががtrueもしくはfalse以外では登録できないこと" do
        @member.is_deleted = nil
        expect(@member).to be_invalid
      end

      it "is_deletedががtrueもしくはfalse以外では登録できないこと" do
        @member.sex = nil
        expect(@member).to be_invalid
      end

      it "passwordが空になってないか" do 
        @member.password = @member.password_confirmation = "a" * 6
        expect(@member). to be_valid

        @member.password = @member.password_confirmation = " " * 6
        expect(@member).to be_invalid  
      end

      it "passwordが6文字以上であるか" do
        @member.password = @member.password_confirmation = "a" * 6
        expect(@member).to be_valid

        @member.password = @member.password_confirmation = "a" * 5
        expect(@member).to be_invalid  
      end
    end

  end

  describe "モデルの関連付け" do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context "Eventモデルとのアソシエーション" do
      let(:target) { :events } 
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "Event" } 
    end

    context "Favoriteモデルとのアソシエーション" do
      let(:target) { :favorites } 
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "Favorite" } 
    end
    
    context "Reviewモデルとのアソシエーション" do
      let(:target) { :reviews } 
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "Review" } 
    end

    context "Couponモデルとのアソシエーション" do
      let(:target) { :coupons } 
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "Coupon" } 
    end

    context "Entryモデルとのアソシエーション" do
      let(:target) { :entries } 
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "Entry" } 
    end

    context "Messageモデルとのアソシエーション" do
      let(:target) { :messages } 
      it { expect(association.macro).to eq :has_many } 
      it { expect(association.class_name).to eq "Message" } 
    end

    context "ActiveRelationshipモデルとのアソシエーション" do
      let(:target) { :active_relationships }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq "Relationship" }
    end

    context "PassiveRelationshipモデルとのアソシエーション" do
      let(:target) { :passive_relationships }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq "Relationship" }
    end

    context "ActiveNotificationモデルとのアソシエーション" do
      let(:target) { :active_notifications }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq "Notification" }
    end

    context "PassiveNotificationモデルとのアソシエーション" do
      let(:target) { :passive_notifications }
      it { expect(association.macro).to eq :has_many }
      it { expect(association.class_name).to eq "Notification"}
    end
  end

  describe "#notification_create!" do
    before do
      @current_member = create(:member)
      @member = create(:guest)
      @room = create(:room1)
      @entry = create(:entry1, member_id: @member.id)
    end

    it "メッセージの通知が保存されること" do
      @message = Message.create!(member_id: @current_member.id, room_id: @room.id, body: 'test')
      @entry = Entry.where.not(member_id: @current_member.id)
                    .find_by(room_id: @room.id)
      @current_member.notification_create!(@room, @message, @entry)

      expect(1).to eq @current_member.active_notifications.size
      expect(1).to eq Notification.first.visiter_id
      expect(2).to eq Notification.first.visited_id
      expect('dm').to eq Notification.first.action  
    end
  end
  
  describe "#coupon_create!" do
    before do
      @member = create(:member)
    end

    it 'クーポンが保存されること' do
      @member.coupon_create!

      expect(1).to eq @member.coupons.size  
    end
  end
  
  describe "#room_ids" do
    before do
      @member1 = create(:member)
      @member2 = create(:guest)
    end

    it "room_idの配列が返ってくること" do
      room = Room.create
      Entry.create(member_id: @member1.id, room_id: room.id)
      Entry.create(member_id: @member2.id, room_id: room.id)
      
      @room_ids = @member1.entries.map { |entry| entry.room.id }
      expect(@member1.room_ids).to eq @room_ids
    end
  end

  describe "#display_gender_text" do
    before do
      @member1 = create(:member, sex: true)
      @member2 = create(:guest, sex: false)
    end

    it "返り値で男性を返すこと" do
      expect(@member1.display_gender_text).to eq "男性"
    end

    it "返り値で女性を返すこと" do
      expect(@member2.display_gender_text).to eq "女性"
    end
  end

  describe "#display_deleted_text" do
    before do
      @member1 = create(:member, is_deleted: true)
      @member2 = create(:guest, is_deleted: false)
    end

    it "返り値で無効を返すこと" do
      expect(@member1.display_deleted_text).to eq "無効"
    end

    it "返り値で有効を返すこと" do
      expect(@member2.display_deleted_text).to eq "有効"
    end
  end
end
