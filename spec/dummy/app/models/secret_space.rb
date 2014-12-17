class SecretSpace < ActiveRecord::Base
  validates :text, presence: true
end
