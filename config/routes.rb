Rails.application.routes.draw do

  devise_for :employees
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routin g.html
  root to: "home#index"
  
  resources :employees do
    resource :address  #:professional_details
    resource :bank_detail
    resource :roles, :designations 
    get :create_address, on: :member
    collection do
      # get 'update_image'
    end
    member do
      post 'send_email'
    end
  end

  resources :leave_details  do
    get :show_traniee, on: :collection
    get :show_hr_leave, on: :member
    get 'update_status'
    resource :leave_types
    resource :leave_status
  end

  resources :images

end
