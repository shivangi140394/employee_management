Rails.application.routes.draw do

  devise_for :employees
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routin g.html
  root to: "home#index"
  
  resources :employees do
    collection do
      # get 'update_image'
    end
    member do
      post 'send_email'
    end
    resources :addresses , :professional_details
    resource :bank_detail
  end

  resources :employee do
    get :invite
  end

  resources :roles do
    resources :employee 
  end

  resources :designations do
    resources :employee 
  end

  resources :leave_types do
    resources :leave_details
  end

  resources :leave_status do
    resources :leave_details
  end

  resources :leave_details  do
    get 'update_status'
  end

  resources :images

end
