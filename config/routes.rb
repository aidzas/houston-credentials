Houston::Credentials::Engine.routes.draw do

  put "credentials", to: "user_credentials#upsert"
  delete "credentials/:id", to: "user_credentials#destroy"

end
