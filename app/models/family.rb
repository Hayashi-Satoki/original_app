class Family < ActiveHash::Base
  self.data = [
    { id: 1, name: ' -- 投稿範囲 -- ' },
    { id: 2, name: '夫婦のみ' },
    { id: 3, name: '全家族 （夫婦 & パパ実家 & ママ実家 ）' },
    { id: 4, name: '夫婦 & パパ実家' },
    { id: 5, name: '夫婦 & ママ実家' }
  ]

  include ActiveHash::Associations
  has_many :pictures

  end
 