class RegistrationsController < Devise::RegistrationsController
  def sign_up(resource_name, resource)
    super

    response = Api.post_customer(current_user.email)[:response]
    current_user.customer_id = JSON.parse(response)['data']['id']
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
