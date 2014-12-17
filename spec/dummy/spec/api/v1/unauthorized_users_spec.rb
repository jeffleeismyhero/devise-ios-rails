describe 'endpoints for unauthorized users' do
  include Rack::Test::Methods
  include_context 'format: json'

  describe "register a user" do
    let(:url) { 'v1/users' }
    let(:user) { build(:user) }

    subject { post url, params }

    context "with valid params" do
      let(:params) do
        {
          user: {
            email: user.email,
            password: user.password,
          }
        }
      end

      it_behaves_like "a successful JSON POST request"

      it 'creates a new user' do
        expect{ subject }.to change(User, :count).by(1)
      end

      it "returns a user" do
        json_response = json_for(subject)
        expect(json_response).to have_key('user')
      end

      it "serializes user with user serializer" do
        json = subject.body
        user = User.find_by_email(params[:user][:email])
        expect(json).to eq UserSerializer.new(user).to_json
      end
    end

    context "with invalid params" do
      invalid_params = [
        { },
        { user: { email: 'ios_man@example.com' } },
        { user: { password: 'alcatraz' } },
      ]
      invalid_params.each do |invalid_param|
        it_behaves_like "a bad JSON request", 422 do
          let(:params) { invalid_param }
        end
      end
    end

    context "with invalid email" do
      let(:params) { { user: { email: 'invalid_email', password: 'alcatraz' } } }

      it_behaves_like "a bad JSON request", 422

      it 'returns error object' do
        error = {
          message: 'Validation failed: Email is invalid',
          code: 0,
          status: 422
        }.stringify_keys
        json_response = json_for(subject)

        expect(json_response).to eq('error' => error)
      end
    end
  end
end
