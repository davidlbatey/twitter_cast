class Stream < ActiveRecord::Base
  validates :hashtag, presence: true
end
