class Site < ActiveRecord::Base
  attr_accessible :desc, :key, :name, :url
  has_many :userSessions
  def create_user_session(endGuess, pageName, duration)
    user_session = UserSession.new()
    user_session.endGuess = endGuess
    user_session.duration = duration
    user_session.pageName = pageName
    user_session.site_id = id
    user_session.save
  end
end
