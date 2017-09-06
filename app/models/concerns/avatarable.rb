# Avatar generation mixin
module Avatarable
  extend ActiveSupport::Concern

  AVATAR_COLORS = %w[8E3C36 FFE5E3 F6C3BF 291F5D 423777 9E82BB 441F6B 2B0A4E
                     3A3C8D 7B7DC0 ADAEDD].freeze

  included do
    delegate :url_helpers, to: 'Rails.application.routes'
  end

  def avatar_url
    url_helpers.send(:avatar_path, avatar_size, avatar_color, avatar_text)
  end

  def avatar_size
    150
  end

  def avatar_text
    raise NotImplementedError, 'must implement avatar_text'
  end

  def avatar_param
    to_param
  end

  def avatar_color
    AVATAR_COLORS[Zlib.crc32(avatar_param).modulo(AVATAR_COLORS.length)]
  end
end
