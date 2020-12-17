class Hour < ActiveHash::Base
  self.data = [  
    {id: 1, name: '1時間' },{id: 2, name: '2時間' }, {id: 3, name: '3時間' },
    {id: 4, name: '4時間' },{id: 5, name: '5時間' }, {id: 6, name: '6時間' }, 
    {id: 7, name: '7時間' },{id: 8, name: '8時間' }, {id: 9, name: '9時間' },
    {id: 10, name: '10時間' },{id: 11, name: '11時間' },{id: 12, name: '12時間' },
    {id: 13, name: '13時間' },{id: 14, name: '14時間' }, {id: 15, name: '15時間' },
    {id: 16, name: '16時間' },{id: 17, name: '17時間' }, {id: 18, name: '18時間' },
    {id: 19, name: '19時間' },{id: 20, name: '20時間' }, {id: 21, name: '21時間' },
    {id: 22, name: '22時間' },{id: 23, name: '23時間' }, {id: 24, name: '24時間' }
 ]
    
  include ActiveHash::Associations
  has_many :plans

end
