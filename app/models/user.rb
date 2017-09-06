# User model
class User < ApplicationRecord
  extend Dragonfly::Model
  include Avatarable

  has_many :enrolments
  has_many :courses, through: :enrolments

  authenticates_with_sorcery!

  enum role: %w[student instructor admin]

  dragonfly_accessor :avatar

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
