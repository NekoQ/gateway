module Connection
  class CreateController < ApplicationController
    before_action :authenticate_user!

    def create
      api = Saltedge.new(APP_ID, SECRET)
      url = "#{SALTEDGE_API}/connect_sessions/create"
      body = {
        "data": {
          "customer_id": current_user.customer_id,
          "return_connection_id": true,
          "consent": {
            "scopes": %w[account_details transactions_details]
          },
          "attempt": {
            "fetch_scopes": %w[accounts transactions]
          }

        }
      }
      status, response = api.request(:post, url, body)
      parsed_response = JSON.parse(response)
      redirect_to parsed_response['data']['connect_url']
    end
  end
end
