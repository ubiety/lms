require 'rails_helper'

RSpec.describe Assignment, type: :model do
  context 'validations' do
    before { FactoryGirl.build(:assignment) }

    it { is_expected.to belong_to(:course) }
  end
end
