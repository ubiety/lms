# User model
class User < ApplicationRecord
  has_merit
  has_paper_trail
  acts_as_paranoid

  extend Dragonfly::Model
  extend FriendlyId
  include Avatarable

  friendly_id :full_name, use: :slugged

  html_schema_type :Person

  has_many :enrolments, dependent: :destroy
  has_many :courses, through: :enrolments
  has_many :taught_courses, class_name: 'Course', foreign_key: :instructor_id

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

  scope :instructors, -> { where.has { |user| user.role == roles[:instructor] } }

  def self.unenrolled(course)
    enrol_table = Arel::Table.new(:enrolments)
    user_table = Arel::Table.new(:users)

    joins(user_table.join(enrol_table, Arel::Nodes::FullOuterJoin)
        .on(user_table[:id].eq(enrol_table[:user_id])).join_sources)
        .where(enrol_table[:course_id].eq(nil)
                   .or(enrol_table[:course_id].not_eq(course.id)))
        .where(user_table[:role].eq(roles[:student]))
  end

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
