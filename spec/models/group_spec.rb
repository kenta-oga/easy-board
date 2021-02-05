require 'rails_helper'

RSpec.describe Group, type: :model do
  describe '#create' do
    before do
      @group = FactoryBot.build(:group)
    end
    describe 'グループ新規作成' do
      context 'グループ新規作成ができる時' do
        it 'nameの値が存在すれば登録できること' do
          expect(@group).to be_valid
        end
      end
      context 'グループ新規作成ができない時' do
        it 'nameが空では登録できないこと' do
          @group.name = nil
          @group.valid?
          expect(@group.errors.full_messages).to include("Name can't be blank")
        end
      end
    end
  end
end
