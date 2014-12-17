Rails.application.routes.draw do
  scope :v1 do
    devise_ios_rails_for :users
    resources :secret_spaces
  end

  if defined?(LetterOpenerWeb)
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
