# User model
class User < ApplicationRecord
  authenticates_with_sorcery!

  enum role: %w[student instructor admin]

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :role, presence: true
  validates :password, on: :create, presence: true
  validates :password_confirmation, on: :create, presence: true
  validates :password, confirmation: true, on: :create, presence: true

  def initials
    if last_name.present?
      "#{first_name[0]}#{last_name[0]}"
    else
      first_name[0]
    end
  end
end
