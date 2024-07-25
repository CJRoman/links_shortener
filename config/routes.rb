Rails.application.routes.draw do
  resources :links

  get "l/:token" => "link_processing#process_link"

  root to: "links#new"
end
