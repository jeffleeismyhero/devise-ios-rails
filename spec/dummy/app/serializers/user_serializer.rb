class UserSerializer < ActiveModel::Serializer
  attributes \
    :id,
    :email,
    :authentication_token,
    :created_at,
    :updated_at
end
