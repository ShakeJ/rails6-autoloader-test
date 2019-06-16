class UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token
  include Knock::Authenticable
  skip_before_action :authenticate, only: %i(refresh sudo)

  private

  def authenticate
    return create_from_login_token if auth_params[:login_token]
    return head :unprocessable_entity if entity&.passwordless?
    super
  end

  def auth_params
    params.permit(:login, :password, :login_token)
  end
end
