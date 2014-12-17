module V1
  describe RequestPasswordResetService do
    describe "request a password reset" do
      let(:user) { create(:user) }

      subject { described_class.new(params).call! }

      context "with an existing email" do
        let(:params) { { email: user.email } }

        it "returns a user" do
          expect(subject).to eq user
        end

        it "sets reset_password_token on a user" do
          subject
          expect(user.reload.reset_password_token).not_to be_nil
        end

        it "saves the date when the password was requested to reset" do
          subject
          expect(user.reload.reset_password_sent_at).not_to be_nil
        end

        it "sends reset instructions to a user" do
          expect{ subject }.to change(ActionMailer::Base.deliveries, :count).by(1)
        end
      end

      context "there is no such user" do
        let(:params) { { email: 'non_existent' } }

        it "calls error method in the context" do
          expect{ subject }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end
end
