require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '#create' do
    before do
      @post = FactoryBot.build(:post)
    end
    describe '新規投稿' do
      context '新規投稿ができる時' do
        it '全ての値が存在すれば新規投稿ができること' do
          expect(@post).to be_valid
        end
        it 'contentが空でもimageが存在すれば新規投稿ができること' do
          @post.content = nil
          expect(@post).to be_valid
        end
        it 'imageが空でもcontentが存在すれば新規投稿ができること' do
          @post.image = nil
          expect(@post).to be_valid
        end
      end
      context '新規投稿ができない時' do
        it 'titleが空では登録できないこと' do
          @post.title = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("Title can't be blank")
        end
        it 'contentとimageが空だと登録できないこと' do
          @post.content = nil
          @post.image = nil
          @post.valid?
          expect(@post.errors.full_messages).to include("Content can't be blank")
        end
        it 'userが紐づいていないと新規投稿できない' do
          @post.user = nil
          @post.valid?
          expect(@post.errors.full_messages).to include('User must exist')
        end
        it 'groupが紐づいていないと新規投稿できない' do
          @post.group = nil
          @post.valid?
          expect(@post.errors.full_messages).to include('Group must exist')
        end
      end
    end
  end
end
