class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    connect_id = params[:connection_id]
    acc_id = params[:account_id]
    request_params = "?connection_id=#{connect_id}&account_id=#{acc_id}"

    url = api_transactions_url + request_params
    response = RestClient.get(url)
    @transactions_list = JSON.parse(response.body)['data']

    pending_url = api_transactions_pending_url + request_params
    response = RestClient.get(pending_url)
    @transactions_list += JSON.parse(response.body)['data']
  end
end
