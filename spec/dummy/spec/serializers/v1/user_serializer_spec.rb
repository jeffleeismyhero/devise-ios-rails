module V1
  describe UserSerializer do
    let(:user) { build(:user, :full) }
    subject { described_class.new(user).attributes }

    it { expect(subject[:id]).to eq(user.id) }
    it { expect(subject[:email]).to eq(user.email) }
    it { expect(subject[:authentication_token]).to eq(user.authentication_token) }
    it { expect(subject[:created_at]).to eq(user.created_at) }
    it { expect(subject[:updated_at]).to eq(user.updated_at) }
  end
end
