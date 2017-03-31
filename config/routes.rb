Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "url#index"
  get "/index" => "url#index"

  get "/new" => "url#new", :as => :new_url
  post "/new" => "url#create"

  get "/:id" => "url#redirect"

  delete "/:id" => "url#destroy", :as => :delete_url

end
