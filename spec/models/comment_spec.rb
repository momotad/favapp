require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメントの情報' do
    context 'コメントできる場合' do
      it '必要な情報をすべて入力' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントできる場合' do
      it 'コメント空白' do
        @comment.content = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content can't be blank")
      end
      it 'ユーザーが紐づいていなければコメントできない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
      it 'アプリが紐づいていなければコメントできない' do
        @comment.app = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('App must exist')
      end
    end
  end
end
