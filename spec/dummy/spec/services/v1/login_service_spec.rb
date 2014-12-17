module V1
  describe LoginService do
    describe "login a user" do
      let(:user) { create(:user) }

      subject { described_class.new(params).call! }

      context "with a valid user" do
        let(:params) do
          {
            email: user.email,
            password: user.password,
          }
        end

        it "returns an authenticated user" do
          expect(subject).to eq user
        end
      end

      context "there is no such user" do
        let(:params) do
          {
            email: 'non_existent',
            password: 'fictional',
          }
        end
        it "calls error method in the context" do
          expect{ subject }.to raise_error(UnauthorizedError)
        end
      end


      context "password doesn't match the user" do
        let(:params) do
          {
            email: user.email,
            password: 'fictional',
          }
        end

        it "calls error method in the context" do
          expect{ subject }.to raise_error(UnauthorizedError)
        end
      end
    end
  end
end
