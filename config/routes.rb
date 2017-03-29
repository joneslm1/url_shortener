Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "url#index"
  get "/index" => "url#index"
  get "/[:id]" => "url#show"
  get "/new" => "url#new", :as => :new_url
  post "/new" => "url#create"
end
