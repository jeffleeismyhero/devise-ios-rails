shared_examples "needs authorization" do
  context "without authentication" do
    before do
      current_session.header('X-User-Token', nil)
      current_session.header('X-User-Email', nil)
    end

    it_behaves_like "an unauthorized JSON request"
  end

  context "with invalid authentication" do
    before { build(:authentication, user: not_existing_user).set_headers(current_session) }

    let(:not_existing_user) { build(:user) }

    it_behaves_like "an unauthorized JSON request"
  end
end
