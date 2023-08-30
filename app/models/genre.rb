class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ARゲーム' },
    { id: 3, name: 'アクション' },
    { id: 4, name: 'アドベンチャー' },
    { id: 5, name: 'インディーズ' },
    { id: 6, name: 'カード' },
    { id: 7, name: 'カジノ' },
    { id: 8, name: 'カジュアル' },
    { id: 9, name: 'シミュレーション' },
    { id: 10, name: 'ストラテジー' },
    { id: 11, name: 'スポーツ' },
    { id: 12, name: 'トリビア' },
    { id: 13, name: 'パズル' },
    { id: 14, name: 'ファミリー' },
    { id: 15, name: 'ボード' },
    { id: 16, name: 'ミュージック' },
    { id: 17, name: 'レーシング' },
    { id: 18, name: 'ロールプレイング' },
    { id: 19, name: '子供向け' },
    { id: 20, name: '単語' }
  ]

  include ActiveHash::Associations
  has_many :apps
end
