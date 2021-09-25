module Api
  class PendingTransactionsController < ApplicationController
    # GET /api/transactions/pending
    def index
      api = Saltedge.new(APP_ID, SECRET)
      connect_id = params[:connection_id]
      acc_id = params[:account_id]
      url = "#{SALTEDGE_API}/transactions/pending?connection_id=#{connect_id}&account_id=#{acc_id}"
      status, response = api.request(:get, url)

      render json: response, status: status
    end
  end
end
