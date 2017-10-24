require 'rails_helper'

RSpec.describe AssignmentPolicy do
  subject { described_class.new(user, record) }

  let(:record) { Assignment.new }

  context 'student' do
    let(:user) { FactoryBot.create :user }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to forbid_action(:destroy) }
  end

  context 'instructor' do
    let(:user) { FactoryBot.create :user, role: 1 }

    it { is_expected.to permit_actions(%w[show destroy]) }
    it { is_expected.to permit_edit_and_update_actions }
    it { is_expected.to permit_new_and_create_actions }
  end

  context 'admin' do
    let(:user) { FactoryBot.create :user, role: 2 }

    it { is_expected.to permit_new_and_create_actions }
    it { is_expected.to permit_edit_and_update_actions }
    it { is_expected.to permit_actions(%w[destroy show]) }
  end
end
