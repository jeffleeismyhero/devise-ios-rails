module V1
  describe RegisterService do
    describe "register a user" do
      subject { described_class.new(params).call! }

      context "with valid params" do
        let(:params) { attributes_for(:user) }

        it 'creates a new user' do
          expect{ subject }.to change(User, :count).by(1)
        end

        it 'returns a new user' do
          expect(subject).to be_a User
        end

        it 'generates a new authentication token' do
          expect(subject.authentication_token).to be_present
        end
      end

      context "email is invalid" do
        let(:params) do
          {
            email: 'invalid email',
            password: 'fictional',
          }
        end

        it 'calls error method in the context' do
          expect{ subject }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end
  end
end
