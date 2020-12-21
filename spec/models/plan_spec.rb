require 'rails_helper'

RSpec.describe Plan, type: :model do
  describe '#create' do
    before do
      @plan = FactoryBot.build(:plan)
    end

    describe '投稿機能' do
      context '投稿がうまくいくとき' do
        it '全てのデータが正しく存在すれば保存できる' do
          expect(@plan).to be_valid
        end
      end

      context '投稿がうまくいかないとき' do
        it 'titleが空だと保存できない' do
          @plan.title = nil
          @plan.valid?
          expect(@plan.errors.full_messages).to include("Titleを入力してください")
        end
        it 'titleが40文字以上だと保存できない' do
          @plan.title = 'あ' * 41
          @plan.valid?
          expect(@plan.errors.full_messages).to include("Titleは40文字以内で入力してください")
        end
        it 'placeが空だと保存できない' do
          @plan.place = nil
          @plan.valid?
          expect(@plan.errors.full_messages).to include("Placeを入力してください")
        end
        it 'category_idが空だと保存できない' do
          @plan.category_id = nil
          @plan.valid?
          expect(@plan.errors.full_messages).to include("Categoryを入力してください")
        end
        it 'timezone_idが空だと保存できない' do
          @plan.timezone_id = nil
          @plan.valid?
          expect(@plan.errors.full_messages).to include("Timezoneを入力してください")
        end
        it 'season_idが空だと保存できない' do
          @plan.season_id = nil
          @plan.valid?
          expect(@plan.errors.full_messages).to include("Seasonを入力してください")
        end
        it 'userが紐付いていないと保存できないこと' do
          @plan.user = nil
          @plan.valid?
          expect(@plan.errors.full_messages).to include('Userを入力してください')
        end
        it 'timeが空だと保存できない' do
          @plan.time = nil
          @plan.valid?
          expect(@plan.errors.full_messages).to include("Timeを入力してください")
        end
        it 'conceptが1000文字以上だと保存できない' do
          @plan.concept = 'あ' * 1001
          @plan.valid?
          expect(@plan.errors.full_messages).to include('Conceptは1000文字以内で入力してください')
        end
        it 'itemが1000文字以上だと保存できない' do
          @plan.item = 'あ' * 1001
          @plan.valid?
          expect(@plan.errors.full_messages).to include('Itemは1000文字以内で入力してください')
        end
        it 'processが1000文字以上だと保存できない' do
          @plan.process = 'あ' * 1001
          @plan.valid?
          expect(@plan.errors.full_messages).to include('Processは1000文字以内で入力してください')
        end
      
        it '費用が空だと保存できない' do
          @plan.cost = nil
          @plan.valid?
          expect(@plan.errors.full_messages).to include('Costを入力してください')
        end

        it '費用が100万以上だと保存できない' do
          @plan.cost = 1,000,001
          @plan.valid?
          expect(@plan.errors.full_messages).to include('Costは不正な値です')
        end
        it '費用が半角数字以外だと保存できない' do
          @plan.cost = '１２三し⑤'
          @plan.valid?
          expect(@plan.errors.full_messages).to include('Costは数値で入力してください')
        end
        it 'imageが空だと保存できない' do
          @plan.image = nil
          @plan.valid?
          expect(@plan.errors.full_messages).to include("Imageを入力してください")
        end
      end
    end
  end
end
