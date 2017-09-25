# User helper methods
module UsersHelper
  def user_avatar(user, options = {})
    if user.avatar.nil?
      image_tag user.default_avatar_url, options
    else
      image_tag user.avatar.thumb('150x150#').url, options
    end
  end
end
