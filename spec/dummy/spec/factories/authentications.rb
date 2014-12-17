class AuthenticationFactory
  attr_reader :user_token, :user_email

  def initialize(user_token:, user_email:)
    @user_token = user_token
    @user_email = user_email
  end

  def to_hash
    {
      userToken: user_token,
      userEmail: user_email,
    }
  end

  def set_headers(session)
    session.header('X-User-Token', @user_token)
    session.header('X-User-Email', @user_email)
  end
end

FactoryGirl.define do
  factory :authentication, class: AuthenticationFactory do
    skip_create

    transient do
      user
    end

    initialize_with do
      user_token ||= user.authentication_token
      user_email ||= user.email
      new(
        user_token: user_token,
        user_email: user_email,
      )
    end
  end

  factory :invalid_authentication, class: AuthenticationFactory do
    initialize_with do
      new(
        user_token: 'non existent',
        user_email: 'no_such@example.com',
      )
    end
  end
end
