class AccountsController < ApplicationController
  before_action :authenticate_user!

  def index
    @connection_id = params[:connection_id]
    url = "#{api_accounts_url}?connection_id=#{@connection_id}"
    response = RestClient.get(url)
    @accounts_list = JSON.parse(response.body)['data']
  end
end
