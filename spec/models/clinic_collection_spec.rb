require 'rails_helper'

RSpec.describe ClinicCollection, type: :model do
  before do
    @clinic = build(:clinic)
  end

  it 'save!メソッドでclinicとgenre_mapに値が保存できること' do
    genre_ids = [1, 2, 3]
    ClinicCollection.new(@clinic, genre_ids).save!

    expect(@clinic).to be_valid
    @clinic.genre_maps.each { |genre_map| expect(genre_map).to be_valid }
    expect(3).to eq (@clinic.genre_maps.size)
  end
end