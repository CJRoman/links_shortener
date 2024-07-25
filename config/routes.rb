Rails.application.routes.draw do
  resources :links, only: [:new, :show, :create]

  get "l/:token" => "link_processing#process_link"

  root to: "links#new"
end
