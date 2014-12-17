require 'rails_helper'

describe ErrorsSerializer do
  let(:errors) { build(:user, email: 'invalid').tap(&:valid?).errors }

  subject { described_class.new(errors).attributes }

  it { expect(subject[:message]).to eq('Validation failed: Email is invalid') }
  it { expect(subject[:code]).to eq(0) }
  it { expect(subject[:status]).to eq(422) }
end
