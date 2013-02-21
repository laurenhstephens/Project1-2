class UserSession < ActiveRecord::Base
  attr_accessible :endGuess, :pageName,  :duration
  belongs_to :site
  validates_presence_of  :endGuess, :pageName, :duration
end
