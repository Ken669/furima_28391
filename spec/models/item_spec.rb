require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'registration test' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/item-sample.png')
    end

    it 'registration done successfully' do
      expect(@item.valid?).to eq true
    end

    context 'registration fails on the following cases' do
      it 'image file is blank' do
        @item.image = nil
        expect(@item.valid?).to eq false
      end

      it 'item name is blank' do
        @item.name = nil
        expect(@item.valid?).to eq false
      end

      it 'item detail is blank' do
        @item.detail = nil
        expect(@item.valid?).to eq false
      end

      it 'category is blank' do
        @item.category_id = 0
        expect(@item.valid?).to eq false
      end

      it 'condition is blank' do
        @item.condition_id = 0
        expect(@item.valid?).to eq false
      end

      it 'shipping_fee is blank' do
        @item.shipping_fee_id = 0
        expect(@item.valid?).to eq false
      end

      it 'prefecture is blank' do
        @item.prefecture_id = 0
        expect(@item.valid?).to eq false
      end

      it 'shipping_schedule is blank' do
        @item.shipping_schedule_id = 0
        expect(@item.valid?).to eq false
      end

      it 'price is less than 300' do
        @item.price = 299
        expect(@item.valid?).to eq false
      end
      it 'price is greater than 9,999,999' do
        @item.price = 10000000
        expect(@item.valid?).to eq false
      end
      it 'price is blank' do
        @item.price = nil
        expect(@item.valid?).to eq false
      end
    end
  end
end
