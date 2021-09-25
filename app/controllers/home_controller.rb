class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @user =	current_user

    response = RestClient.get("#{api_connections_url}?customer_id=#{@user.customer_id}")
    @connections_list = JSON.parse(response.body)['data']
  end
end
