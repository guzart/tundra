class UserTokenController < Knock::AuthTokenController
  # POST /user_token
  # {"auth": {"email": "foo@bar.com", "password": "secret"}}
  #
  # 201 Created
  # {"jwt": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9"}
  #
  # Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9
  # GET /my_resources
end
