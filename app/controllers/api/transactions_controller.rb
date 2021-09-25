module Api
  class TransactionsController < ApplicationController
    # GET /api/transactions
    def index
      api = Saltedge.new(APP_ID, SECRET)
      url = "#{SALTEDGE_API}/transactions?connection_id=#{params[:connection_id]}&account_id=#{params[:account_id]}"
      status, response = api.request(:get, url)
      render json: response, status: status
    end
  end
end
