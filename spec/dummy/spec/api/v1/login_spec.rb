describe 'login to application endpoint' do
  include Rack::Test::Methods
  include_context 'format: json'

  describe "login a user" do
    let(:url) { 'v1/users/sign_in' }
    let(:user) { create(:user) }
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
    end

    context "with invalid params" do
      invalid_params = [
        {},
        { user: { email: 'ios_man@example.com' } },
        { user: { password: 'alcatraz' } },
      ]
      invalid_params.each do |invalid_param|
        it_behaves_like "an unauthorized JSON request" do
          let(:params) { invalid_param }
        end
      end
    end

    context "with a valid user" do
      let(:params) do
        {
          user: {
            email: user.email,
            password: user.password,
          }
        }
      end

      it "returns a user" do
        json_response = json_for(subject)
        expect(json_response).to have_key('user')
      end

      it "serializes user with user serializer" do
        expect(subject.body).to eq UserSerializer.new(user).to_json
      end
    end

    context "there is no such user in DB" do
      let(:params) do
        {
          user: {
            email: 'non_existent',
            password: 'fictional',
          }
        }
      end

      it_behaves_like "an unauthorized JSON request"
    end

    context "password doesn't match the user" do
      let(:params) do
        {
          user: {
            email: user.email,
            password: 'fictional',
          }
        }
      end

      it_behaves_like "an unauthorized JSON request"
    end
  end
end
