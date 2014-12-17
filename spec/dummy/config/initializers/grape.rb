module Grape
  class API
    def self.require_authentication_token_doc
      {
        headers: {
          'X-User-Email' => {
            description: 'user email', required: true
          },
          'X-User-Token' => {
            description: 'user authentication token', required: true
          }
        }
      }
    end
  end
end
