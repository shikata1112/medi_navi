require 'rails_helper'

RSpec.describe ClinicCollection, type: :model do
  before do
    @clinic1 = build(:clinic)
    @clinic2 = build(:clinic)
  end

  describe 'メソッドの動作テスト' do

    it 'save!メソッドでclinicとgenre_mapに値が保存できること' do
      genre_ids = [1, 2, 3]
      ClinicCollection.new(@clinic1, genre_ids).save!

      expect(@clinic1).to be_valid
      @clinic1.genre_maps.each { |genre_map| expect(genre_map).to be_valid }
      expect(3).to eq (@clinic1.genre_maps.size)

      expect(3).to eq GenreMap.all.size
    end

    it 'update!メソッドでgenre_mapの値が更新できること' do
      genre_ids = [1, 2, 3, 4]
      ClinicCollection.new(@clinic1, genre_ids).update!

      genre_ids = [1, 2]
      ClinicCollection.new(@clinic2, genre_ids).update!

      expect(@clinic1).to be_valid
      @clinic1.genre_maps.each { |genre_map| expect(genre_map).to be_valid }
      expect(4).to eq (@clinic1.genre_maps.size)
      expect(2).to eq (@clinic2.genre_maps.size)

      expect(6).to eq GenreMap.all.size
    end
  end
end