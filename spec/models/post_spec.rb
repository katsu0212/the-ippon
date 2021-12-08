require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe 'メッセージ投稿' do
    context 'メッセージが投稿できる場合' do
      it 'contentとimageが存在していれば保存できる' do
        expect(@post).to be_valid
      end
      it 'contentが空でも保存できる' do
        @post.content = ''
        expect(@post).to be_valid
      end
      it 'imageが空でも保存できる' do
        @post.image = nil
        expect(@post).to be_valid
      end
    end
    context 'メッセージが投稿できない場合' do
      it 'contentとimageが空では保存できない' do
        @post.content = ''
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Content can't be blank")
      end
      it 'roomが紐付いていないと保存できない' do
        @post.room = nil 
        @post.valid?
        expect(@post.errors.full_messages).to include('Room must exist')
      end
      it 'userが紐付いていないと保存できない' do
        @post.user = nil 
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end
    end
  end
end
