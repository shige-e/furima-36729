require 'rails_helper'

RSpec.describe OrderInformation, type: :model do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_information = FactoryBot.build(:order_information, user_id: user.id, item_id: item.id)
      sleep 0.1 
    end

  describe '情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order_information).to be_valid
      end
      it 'building_nameは空でも購入できること' do
        @order_information.building_name = ''
        expect(@order_information).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_information.postal_code = ''
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_information.postal_code = '1234567'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'area_idを選択していないと保存できないこと' do
        @order_information.area_id = 0
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Area can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @order_information.address = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @order_information.telephone_number = ''
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが10桁未満では保存できないこと' do
        @order_information.telephone_number = '123456789'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include('Telephone number is invalid.')
      end
      it 'telephone_numberが11桁を超過すると保存できないこと' do
        @order_information.telephone_number = '123456789012'
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include('Telephone number is invalid.')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_information.user_id = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_information.item_id = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_information.token = nil
        @order_information.valid?
        expect(@order_information.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end
