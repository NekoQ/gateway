module Api
  class AccountsController < ApplicationController
    # GET /api/accounts?connection_id=
    def index
      api = Saltedge.new(APP_ID, SECRET)
      url = "#{SALTEDGE_API}/accounts?connection_id=#{params[:connection_id]}"
      status, response = api.request(:get, url)

      render json: response, status: status
    end
  end
end
