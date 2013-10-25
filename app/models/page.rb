class Page < ActiveRecord::Base
  attr_accessible :fb_id, :image, :name

  validates_presence_of :fb_id, :name
  validates_uniqueness_of :fb_id
end
