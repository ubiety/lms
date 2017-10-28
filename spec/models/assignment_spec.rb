require 'rails_helper'

RSpec.describe Assignment, type: :model do
  context 'validations' do
    before { FactoryBot.build(:assignment) }

    it { is_expected.to belong_to(:course) }
  end
end
