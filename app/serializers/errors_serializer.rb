class ErrorsSerializer < ActiveModel::Serializer
  root 'error'
  attributes :message, :code, :status

  def message
    "Validation failed: #{object.full_messages.join(', ')}"
  end

  def code
    0
  end

  def status
    422
  end
end
