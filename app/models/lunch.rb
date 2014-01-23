class Lunch < ActiveRecord::Base
  attr_accessible :lunch_date, :vote_close, :vote_open
  has_many :lunch_places
  has_many :places, :through=>:lunch_places


  def is_voting_open?
    return Time.now >= vote_open && Time.now <= vote_close
  end
  
  def is_past?
    return Time.now > lunch_date
  end
  
  def is_limbo?
    return Time.now > vote_close && Time.now < lunch_date
  end
  
end
