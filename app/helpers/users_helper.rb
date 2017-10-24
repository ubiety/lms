# User helper methods
module UsersHelper
  def user_avatar_tag(user, options = {})
    avatar = user.avatar
    if avatar
      image_tag avatar.thumb('150x150#').url, options
    else
      image_tag user.default_avatar_url, options
    end
  end
end
