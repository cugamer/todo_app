class Task < ActiveRecord::Base
  belongs_to :list
  
  validates :name, presence: true, length: { maximum: 100 }
  
  after_initialize { self.completed = false } 
end
