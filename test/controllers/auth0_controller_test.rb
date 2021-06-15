require 'test_helper'

class Auth0ControllerTest < ActionDispatch::IntegrationTest
  setup do
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
  end

  test "should fill user infos and redirect to root" do
    get auth0_callback_url
    assert_redirected_to root_path
    assert_not_empty session[:userinfo]
  end

  # test "should fail and redirect user" do
  #   OmniAuth.config.mock_auth[:google] = :invalid_credentials
  #   OmniAuth.config.on_failure = Proc.new { |env|
  #     OmniAuth::FailureEndpoint.new(env).redirect_to_failure
  #   }
  #
  #   get auth0_callback_url
  #   assert_redirected_to auth0_failure_url
  #   assert true
  # end

  test "should logout and redirect to root" do
    get auth0_logout_url
    assert_redirected_to root_path
    assert_nil session[:userinfo]
  end
end
