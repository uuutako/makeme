class Minute < ActiveHash::Base
  self.data = [  
    {id: 1, name: '10分' },{id: 2, name: '20分' },
    {id: 3, name: '30分' }, {id: 4, name: '40分' },{id: 5, name: '50分' }
 ]
    
  include ActiveHash::Associations
  has_many :plans

end
