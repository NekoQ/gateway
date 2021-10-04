class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    connect_id = params[:connection_id]
    acc_id = params[:account_id]

    response = Api.get_transactios(connect_id, acc_id)[:response]
    @transactions_list = JSON.parse(response)['data']

    response = Api.get_pending_transactions(connect_id, acc_id)[:response]
    @transactions_list += JSON.parse(response)['data']
  end
end
