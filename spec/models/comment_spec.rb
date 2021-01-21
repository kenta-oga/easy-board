require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    before do
      @post = FactoryBot.create(:post)
      @user = FactoryBot.create(:user)
      @comment = FactoryBot.build(:comment, post_id: @post.id, user_id: @user.id)
      sleep(1)
    end
    describe 'コメント投稿' do
      context 'コメントの投稿ができる時' do
        it 'textが存在すれば投稿できること' do
          expect(@comment).to be_valid
        end
      end
      context 'コメント投稿ができない時' do
        it 'textが空では投稿できないこと' do
          @comment.text = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include("Text can't be blank")
        end
        it 'userが紐づいていないとコメントを投稿できない' do
          # binding.pry
          @comment.user_id = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include('User must exist')
        end
        it 'postが紐づいていないとコメントを投稿できない' do
          @comment.post_id = nil
          @comment.valid?
          expect(@comment.errors.full_messages).to include('Post must exist')
        end
      end
    end
  end
end
