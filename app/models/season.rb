class Season < ActiveHash::Base
  self.data = [  
    {id: 1, name: '春' },
    {id: 2, name: '夏' },{id: 3, name: '秋' },
    {id: 4, name: '冬' },{id: 5, name: '1年中' }
  ]
    
  include ActiveHash::Associations
  has_many :plans

end