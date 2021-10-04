class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @user =	current_user

    response = Api.get_connections(@user.customer_id)[:response]
    @connections_list = JSON.parse(response)['data']
  end
end
