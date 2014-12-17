FactoryGirl.define do
  factory :error, class: V1::Error do
    skip_create

    initialize_with do
      new(
        message: message,
        status: status,
        code: code
      )
    end

    transient do
      message 'Unexpected Error!'
      status 500
      code 0
    end
  end
end
