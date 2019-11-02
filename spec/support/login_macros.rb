module LoginMacros
  def auth_user(role)
    before(:each) do
      user = create(role.to_sym)
      sign_in user
      request.headers.merge!(user.create_new_auth_token)
    end
  end
end
