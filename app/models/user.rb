# User model
class User < ApplicationRecord
  has_merit
  has_paper_trail
  acts_as_paranoid

  extend Dragonfly::Model
  include Avatarable

  html_schema_type :Person

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

  paginates_per 15

  ransack_alias :full_name, :first_name_or_last_name

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
