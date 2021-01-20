require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#create' do
    before do
      @post = FactoryBot.build(:post)
    end

    it '全ての値が存在すれば登録できること' do
      expect(@post).to be_valid
    end

    it 'titleが空では登録できないこと' do
      #binding.pry
      @post.title = nil
      @post.valid?
      expect(@post.errors.full_messages).to include("Title can't be blank")
    end
  end
end
