require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    before { FactoryGirl.build(:user) }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:password_confirmation) }
    it { is_expected.to validate_confirmation_of(:password) }
    it { is_expected.to validate_presence_of(:role) }
    it { is_expected.to define_enum_for(:role) }
    it { is_expected.to have_many(:enrolments) }
    it { is_expected.to have_many(:courses).through(:enrolments) }
  end
end
