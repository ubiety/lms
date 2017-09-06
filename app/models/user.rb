# User model
class User < ApplicationRecord
  include Avatarable
  authenticates_with_sorcery!

  enum role: %w[student instructor admin]

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :role, presence: true
  validates :password, on: :create, presence: true
  validates :password_confirmation, on: :create, presence: true
  validates :password, confirmation: true, on: :create, presence: true

  def full_name
    if last_name.present?
      "#{first_name} #{last_name}"
    else
      first_name
    end
  end

  def avatar_text
    full_name
  end
end
