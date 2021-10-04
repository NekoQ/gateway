class AccountsController < ApplicationController
  before_action :authenticate_user!

  def index
    @connection_id = params[:connection_id]

    response = Api.get_accounts(@connection_id)[:response]
    @accounts_list = JSON.parse(response)['data']
  end
end
