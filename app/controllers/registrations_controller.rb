class RegistrationsController < Devise::RegistrationsController
  def sign_up(resource_name, resource)
    super

    puts api_customers_url
    response = RestClient.post(api_customers_url, { 'data' => { 'identifier' => current_user.email } })
    current_user.customer_id = JSON.parse(response.body)['data']['id']
    current_user.save
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
