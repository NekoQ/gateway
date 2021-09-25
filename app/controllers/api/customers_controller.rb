module Api
  class CustomersController < ApplicationController
    skip_before_action :verify_authenticity_token
    # POST /api/customers
    def create
      api = Saltedge.new(APP_ID, SECRET)
      url = "#{SALTEDGE_API}/customers"
      permitted = params.require(:data)
      status, response = api.request(:post, url, { 'data' => permitted })
      render json: response, status: status
    end
  end
end
