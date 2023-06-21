Rails.application.routes.draw do
  root "pdf#index"
  post '', to: "pdf#index"
  get 'prawn', to: 'pdf#prawn'
  get 'wicked', to: 'pdf#wicked'
end
