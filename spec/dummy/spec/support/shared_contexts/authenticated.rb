shared_context 'authenticated' do
  before { build(:authentication, user: user).set_headers(current_session) }
end
