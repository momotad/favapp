require 'rails_helper'

RSpec.describe App, type: :model do
  before do
    @app = FactoryBot.build(:app)
  end

  describe 'おすすめアプリ投稿の投稿情報' do
    context '投稿ができる場合' do
      it '必要な情報をすべて入力' do
        expect(@app).to be_valid
      end
    end

    context '投稿ができない場合' do
      it '画像なし' do
        @app.image = nil
        @app.valid?
        expect(@app.errors.full_messages).to include("Image can't be blank")
      end
      it 'アプリ名なし' do
        @app.name = nil
        @app.valid?
        expect(@app.errors.full_messages).to include("Name can't be blank")
      end
      it 'おすすめポイントなし' do
        @app.content = nil
        @app.valid?
        expect(@app.errors.full_messages).to include("Content can't be blank")
      end
      it 'ジャンル情報なし' do
        @app.genre_id = 1
        @app.valid?
        expect(@app.errors.full_messages).to include("Genre can't be blank")
      end
      it 'ユーザーが紐づいていなければ投稿できない' do
        @app.user = nil
        @app.valid?
        expect(@app.errors.full_messages).to include('User must exist')
      end
    end
  end
end
