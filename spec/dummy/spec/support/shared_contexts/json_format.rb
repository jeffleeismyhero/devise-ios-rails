shared_context 'format: json' do
  before do
    current_session.header('Accept', 'application/json')
  end
end
