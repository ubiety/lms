RSpec.describe CoursePolicy do
  subject { described_class.new(user, record) }

  let(:record) { Course.new }

  context 'student' do
    let(:user) { FactoryGirl.create :user }

    it { is_expected.to permit_actions(%w[index show]) }
    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to forbid_action(:destroy) }
  end

  context 'instructor' do
    let(:user) { FactoryGirl.create :user, role: 1 }

    it { is_expected.to permit_actions(%w[index show]) }
    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to forbid_action(:destroy) }
  end

  context 'admin with no instructors' do
    let(:user) { FactoryGirl.create :user, role: 2 }

    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to forbid_edit_and_update_actions }
    it { is_expected.to permit_actions(%w[index destroy show]) }
  end
end
