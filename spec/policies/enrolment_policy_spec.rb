RSpec.describe EnrolmentPolicy do
  subject { described_class.new(user, record) }

  let(:record) { Enrolment.new }

  context 'student' do
    let(:user) { FactoryGirl.create :user }

    it { is_expected.to forbid_actions(%w[index show destroy]) }
    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to forbid_new_and_create_actions }
  end

  context 'instructor' do
    let(:user) { FactoryGirl.create :user, role: 1 }

    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to permit_new_and_create_actions }
    it { is_expected.to forbid_actions(%w[index show destroy]) }
  end

  context 'admin' do
    let(:user) { FactoryGirl.create :user, role: 2 }

    it { is_expected.to permit_new_and_create_actions }
    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to forbid_actions(%w[index destroy show]) }
  end
end
