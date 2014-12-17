shared_examples "a good JSON request" do |response_code|
  it "returns an OK (#{response_code}) status code" do
    expect(subject.status).to eq(response_code)
  end

  it "is a JSON response" do
    expect(subject.content_type).to include 'application/json'
  end
end

shared_examples "a successful JSON GET request" do
  it_behaves_like "a good JSON request", 200
end

shared_examples "a successful JSON PUT request" do
  it_behaves_like "a good JSON request", 200
end

shared_examples "a successful JSON POST request" do
  it_behaves_like "a good JSON request", 201
end

shared_examples "a successful JSON DELETE request" do
  it_behaves_like "a good JSON request", 200
end

shared_examples "a bad JSON request" do |response_code|
  it "returns a (#{response_code}) status code" do
    expect(subject.status).to eq(response_code)
  end

  it "is a JSON response" do
    expect(subject.content_type).to include 'application/json'
  end

  it "returns an error object" do
    expect(json_for(subject)).to have_key('error')
  end
end

shared_examples "an unsuccessful JSON request" do
  it_behaves_like "a bad JSON request", 400
end

shared_examples "an unauthorized JSON request" do
  it_behaves_like "a bad JSON request", 401

  it "returns error object" do
    json_response = json_for(subject)
    expect(json_response).to have_key('error')
  end
end

shared_examples "a forbidden JSON request" do
  it_behaves_like "a bad JSON request", 403

  it "returns error object" do
    json_response = json_for(subject)
    expect(json_response).to have_key('error')
  end
end

shared_examples "a not found JSON request" do
  it_behaves_like "a bad JSON request", 404
end
