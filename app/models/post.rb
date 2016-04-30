class Post < ActiveRecord::Base
  
  include HasGuid

  belongs_to :location

  validates :content, presence: true
end
