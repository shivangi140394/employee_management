Rails.application.routes.draw do

  devise_for :employees
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routin g.html
  root to: "home#index"
  
  resources :employees do
  resources :addresses , :professional_details
  resource :bank_detail
  end

  resources :roles do
  resources :employee 
  end

  resources :designations do
  resources :employee 
  end


end
