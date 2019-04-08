Rails.application.routes.draw do

  devise_for :employees
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routin g.html
  root to: "home#index"
  
  resources :employees do
    resources :addresses , :professional_details
    resource :bank_detail
    resource :roles, :designations 
    collection do
      # get 'update_image'
    end
    member do
      post 'send_email'
    end
  end

  resources :leave_details  do
    get :show_traniee, on: :collection
    get 'update_status'
    resource :leave_types
    resource :leave_status
  end

  resources :images

end
