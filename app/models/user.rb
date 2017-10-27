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

  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'receiver_id'
  has_many :personal_messages, dependent: :destroy

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
    User.select(Arel.star).where(
      User[:role].eq(roles[:student]).and(Enrolment[:course_id].not_eq(course.id)
                                            .or(Enrolment[:course_id].nil?))
        .joins(User.arel_table.join(Enrolment.arel_table, Arel::Nodes::OuterJoin)
                 .on(Enrolment[:user_id]).eq(User[:id]).join_sources)
    )
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
