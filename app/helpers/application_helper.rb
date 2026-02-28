module ApplicationHelper
  def app_title
    ENV.fetch("APP_TITLE", "OAuth Mini BBS")
  end
end
