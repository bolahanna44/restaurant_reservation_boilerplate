Rails.application.routes.draw do
  apipie
  devise_for :users, controllers: {
      passwords: 'users/passwords'
  }

  draw :api
end
