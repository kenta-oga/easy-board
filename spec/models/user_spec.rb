require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'ユーザー新規登録' do
      context 'ユーザー新規登録ができる時' do
        it '全項目が存在すれば登録できること' do
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上であれば登録できること' do
          @user.password = 'test01'
          @user.password_confirmation = 'test01'
          expect(@user).to be_valid
        end
      end
      context 'ユーザー新規登録ができない時' do
        it 'nameが空では登録できないこと' do
          @user.name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Name can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'passwordが空では登録できないこと' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'password_confirmationが空では登録できないこと' do
          @user.password = 'test01'
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordが英字のみでは登録できないこと' do
          @user.password = 'testtest'
          @user.password_confirmation = 'testtest'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end

        it 'passwordが数値のみでは登録できないこと' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end

        it 'passwordが全角では登録できないこと' do
          @user.password = 'ｔｅｓｔ０１'
          @user.password_confirmation = 'ｔｅｓｔ０１'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end

        it 'passwordが5文字以下であれば登録できないこと' do
          @user.password = 'test1'
          @user.password_confirmation = 'test1'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = 'test01'
          @user.password_confirmation = 'test02'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'emailに、＠が含まれていないと登録できないこと' do
          @user.email = 'testtest'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
      end
    end
  end
end
