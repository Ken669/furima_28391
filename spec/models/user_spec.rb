require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user registration test' do
    before do
      @user = FactoryBot.build(:user)
      @another = FactoryBot.create(:user)
    end

    it 'account create done successfully if all the items are valid' do
      expect(@user.valid?).to eq true
    end

    context 'account create fail if each is invalid' do
      it 'nickname is empty' do
        @user.nickname = nil
        expect(@user.valid?).to eq false
      end

      it 'email is empty' do
        @user.email = nil
        expect(@user.valid?).to eq false
      end
      it "email doesn't have @ " do
        @user.email = Faker::Internet.password
        expect(@user.valid?).to eq false
      end
      it "email is already used" do
        @user.email = @another.email
        expect(@user.valid?).to eq false
      end

      it "password is empty" do
        @user.password = nil
        expect(@user.valid?).to eq false
      end
      it 'words in password field are less than 6 letters' do
        @user.password = Faker::Lorem.characters(number: 5)
        @user.password_confirmation = @user.password
        expect(@user.valid?).to eq false
      end
      it "password field is filled with letters that are not alphabet or digit" do
        @user.password = Faker::Internet.mac_address
        @user.password_confirmation = @user.password
        expect(@user.valid?).to eq false
      end
      it "password field is filled with digits all" do
        @user.password = Faker::Number.number(digits: 6)
        @user.password_confirmation = @user.password
        expect(@user.valid?).to eq false
      end
      it "password field is filled with alphabetical letters all" do
        @user.password = Faker::Name.initials(number: 6)
        @user.password_confirmation = @user.password
        expect(@user.valid?).to eq false
      end
      it "password confirmation doesn't match" do
        @user.password_confirmation = ""
        expect(@user.valid?).to eq false
      end

      it 'first name is empty' do
        @user.first_name = nil
        expect(@user.valid?).to eq false
      end
      it 'last name is empty' do
        @user.last_name = nil
        expect(@user.valid?).to eq false
      end
      it 'first name field is filled with half-width letters' do
        @user.first_name = Faker::Internet.username
        expect(@user.valid?).to eq false
      end
      it 'last name field is filled with half-width letters' do
        @user.last_name = Faker::Internet.username
        expect(@user.valid?).to eq false
      end

      it 'kana of first name is empty' do
        @user.first_name_kana = nil
        expect(@user.valid?).to eq false
      end
      it 'kana of last name is empty' do
        @user.last_name_kana = nil
        expect(@user.valid?).to eq false
      end
      it 'kana of first name is filled with half-width letters' do
        @user.first_name_kana = Faker::Internet.username
        expect(@user.valid?).to eq false
      end
      it 'kana of last name is filled with half-width letters' do
        @user.last_name_kana = Faker::Internet.username
        expect(@user.valid?).to eq false
      end
      it 'kana of first name is filled with hiragana' do
        @user.first_name_kana = Gimei.last.hiragana
        expect(@user.valid?).to eq false
      end
      it 'kana of last name field is filled with hiragana' do
        @user.last_name_kana = Gimei.last.hiragana
        expect(@user.valid?).to eq false
      end
      it 'kana of first name is filled with kanji' do
        @user.first_name_kana = Gimei.last.kanji
        expect(@user.valid?).to eq false
      end
      it 'kana of last name field is filled with kanji' do
        @user.last_name_kana = Gimei.last.kanji
        expect(@user.valid?).to eq false
      end

      it 'birthday is empty' do
        @user.birthday = nil
        expect(@user.valid?).to eq false
      end
    end
  end
end
