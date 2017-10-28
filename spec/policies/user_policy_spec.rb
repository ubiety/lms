RSpec.describe UserPolicy do
  subject { described_class.new(user, record) }

  let(:record) { User.new }

  context 'student' do
    let(:user) { FactoryBot.create :user }

    it { is_expected.to permit_action(:show) }
    it { is_expected.to permit_edit_and_update_actions }
    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to forbid_actions(%w[index destroy]) }
  end

  context 'instructor' do
    let(:user) { FactoryBot.create :user, role: 1 }

    it { is_expected.to permit_actions(%w[index show]) }
    it { is_expected.to permit_edit_and_update_actions }
    it { is_expected.to forbid_new_and_create_actions }
    it { is_expected.to forbid_action(:destroy) }
  end

  context 'admin' do
    let(:user) { FactoryBot.create :user, role: 2 }

    it { is_expected.to permit_new_and_create_actions }
    it { is_expected.to permit_edit_and_update_actions }
    it { is_expected.to permit_actions(%w[index destroy show]) }
  end
end
