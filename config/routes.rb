Rails.application.routes.draw do
  resources :links

  get "l/:token" => "link_processing#process"

  root to: "links#index"
end
