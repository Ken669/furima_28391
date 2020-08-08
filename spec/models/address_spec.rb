require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'registration test' do
    before do
      @address = FactoryBot.build(:address)
    end

    context 'done successfully on the following cases' do
      it 'when all are filled' do
        expect(@address.valid?).to eq true
      end

      it 'without building name' do
        @address.building_name = nil
        expect(@address.valid?).to eq true
      end
    end

    context 'returns fail on the following cases' do
      it 'postal_code is nil' do
        @address.postal_code = nil
        expect(@address.valid?).to eq false
      end
      it 'postal_code do not have hyphen' do
        @address.postal_code = Faker::Number.number(digits: 7)
        expect(@address.valid?).to eq false
      end

      it 'prefecture_id is nil' do
        @address.prefecture_id = 0
        expect(@address.valid?).to eq false
      end

      it 'city is nil' do
        @address.city = nil
        expect(@address.valid?).to eq false
      end

      it 'town is nil' do
        @address.town = nil
        expect(@address.valid?).to eq false
      end

      it 'phone is nil' do
        @address.phone = nil
        expect(@address.valid?).to eq false
      end
      it 'phone is less than 10 digits' do
        @address.phone = Faker::Number.decimal_part(digits: 9)
        expect(@address.valid?).to eq false
      end
    end
  end
end
