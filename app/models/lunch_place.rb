class LunchPlace < ActiveRecord::Base
  attr_accessible :lunch_id, :place_id
  belongs_to :lunch
  belongs_to :place
  acts_as_votable
end
