# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.secret_key = Rails.application.secrets.secret_key_base

  # ==> Mailer Configuration
  config.mailer_sender = ENV.fetch('DEFAULT_SENDER')
  config.mailer = 'Devise::Mailer'

  # ==> ORM configuration
  require 'devise/orm/active_record'
  config.authentication_keys = [ :email ]
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.params_authenticatable = true
  config.http_authenticatable = false
  config.http_authenticatable_on_xhr = true
  config.http_authentication_realm = 'Application'
  config.paranoid = true
  config.skip_session_storage = [:http_auth]
  config.clean_up_csrf_token_on_authentication = true

  # ==> Configuration for :database_authenticatable
  config.stretches = Rails.env.test? ? 1 : 10

  # ==> Configuration for :rememberable
  config.remember_for = 2.weeks
  config.expire_all_remember_me_on_sign_out = true
  config.extend_remember_period = false

  # ==> Configuration for :validatable
  config.password_length = 4..128
  config.timeout_in = 30.minutes
  config.expire_auth_token_on_timeout = false

  # ==> Configuration for :recoverable
  config.reset_password_keys = [ :email ]
  config.reset_password_within = 6.hours

  # ==> Scopes configuration
  config.scoped_views = false
  config.default_scope = :user
  config.sign_out_all_scopes = true

  # ==> Navigation configuration
  config.sign_out_via = :delete
end
