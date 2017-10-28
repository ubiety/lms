require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'validations' do
    before { FactoryBot.build(:course) }

    it { is_expected.to have_many(:enrolments) }
    it { is_expected.to have_many(:students).through(:enrolments) }
    it { is_expected.to belong_to(:instructor) }
  end
end
