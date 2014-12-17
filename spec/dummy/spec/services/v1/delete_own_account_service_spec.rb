module V1
  describe DeleteOwnAccountService do
    let!(:user) { create(:user) }

    subject { described_class.new(user).call! }

    it "removes a user" do
      expect{ subject }.to change(User, :count).by(-1)
    end

    it "returns a user" do
      expect(subject).to be_a User
    end

    context "with a nil instead of a user" do
      subject { described_class.new(nil).call! }

      it { is_expected.to be_nil }
    end
  end
end
