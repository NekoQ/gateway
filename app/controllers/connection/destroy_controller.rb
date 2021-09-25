module Connection
  class DestroyController < ApplicationController
    before_action :authenticate_user!

    def index
      api = Saltedge.new(APP_ID, SECRET)
      connect_id = params[:connection_id]
      url = "#{SALTEDGE_API}/connections/#{connect_id}"

      status, response = api.request(:delete, url)
      parsed_response = JSON.parse(response)

      if status == 200
        redirect_to root_path, notice: 'Destroy successful.'
      else
        redirect_to root_path, alert: parsed_response['error']['message']
      end
    end
  end
end
