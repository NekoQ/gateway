module Api
  class ConnectionsController < ApplicationController
    # GET /api/connecions?customer_id=
    def index
      api = Saltedge.new(APP_ID, SECRET)
      url = "#{SALTEDGE_API}/connections?customer_id=#{params[:customer_id]}"
      status, response = api.request(:get, url)

      render json: response, status: status
    end
  end
end
