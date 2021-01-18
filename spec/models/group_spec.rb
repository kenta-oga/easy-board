require 'rails_helper'

RSpec.describe Group, type: :model do
  describe '#create' do
    before do
      @group = FactoryBot.build(:group)
    end

    it 'nameの値が存在すれば登録できること' do
      expect(@group).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @group.name = nil
      @group.valid?
      expect(@group.errors.full_messages).to include("Name can't be blank")
    end
  end
end
