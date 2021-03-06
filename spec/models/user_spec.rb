require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it '全てのデータが存在すれば登録できる' do
          expect(@user).to be_valid
        end
      end
      context '新規登録がうまくいかないとき' do
        it 'nameが空だと登録できない' do
          @user.name = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Nameを入力してください")
        end
        it '重複したnameが存在する場合登録ができない' do
          @user.save
          another_user = FactoryBot.build(:user, name: @user.name)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Nameはすでに存在します')
        end
        it 'emailが空では登録できない' do
          @user.email = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Eメールを入力してください")
        end
        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
        end
        it 'emailに@が含まれていない場合登録できない' do
          @user.email = 'test.1mail'
          @user.valid?
          expect(@user.errors.full_messages).to include('Eメールは不正な値です')
        end
        it 'passwordが空では登録できない' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワードを入力してください")
        end
        it 'passwordが6文字以下であれば登録できない' do
          @user.password = '12345'
          @user.encrypted_password = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
        end
        it 'passwordが存在しても,password_confirmationが空では登録できない' do
          @user.password = 'abc34567'
          @user.encrypted_password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end
        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = 'ab23456'
          @user.password = 'abc34567'
          @user.valid?
          expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
        end
        it 'passwordが半角英字のみの場合登録できない' do
          @user.password = 'abcdefg'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは不正な値です')
        end
        it 'passwordが半角数字のみの場合登録できない' do
          @user.password = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは不正な値です')
        end
      end
    end
  end
end
