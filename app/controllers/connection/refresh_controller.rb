module Connection
  class RefreshController < ApplicationController
    before_action :authenticate_user!

    def update
      api = Saltedge.new(APP_ID, SECRET)
      url = "#{SALTEDGE_API}/connections/#{params[:id]}/refresh"
      body = {
        "data": {
          "attempt": {
            "fetch_scopes": %w[accounts transactions]
          }
        }
      }
      status, response = api.request(:put, url, body)
      parsed_response = JSON.parse(response)
      puts status
      if status == 200
        redirect_to root_path, notice: 'Refresh successful.'
      else
        redirect_to root_path, alert: parsed_response['error']['message']
      end
    end
  end
end
