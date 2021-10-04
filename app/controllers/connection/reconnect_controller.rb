module Connection
  class ReconnectController < ApplicationController
    before_action :authenticate_user!

    def update
      api = Saltedge.new(APP_ID, SECRET)
      url = "#{SALTEDGE_API}/connect_sessions/reconnect"
      customer_id = params[:customer_id]
      connect_id = params[:id]
      body = {
        "data": {
          "customer_id": customer_id,
          "connection_id": connect_id,
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
