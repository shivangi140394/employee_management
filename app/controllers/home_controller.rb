class HomeController < ApplicationController
  # load_and_authorize_resource
# before_action :set_post, only: [:show, :edit, :update]

#   def index
#      @homes = Home.all
#   end

#   def show
    
#   end

#   def new
#     @home = Home.new
#   end

#   def create
#     @home = Home.new(home_params)
#     if @home.save
#       redirect_to home_path(@home)
#     else
#       render :edit
#     end
#   end

#   def edit
#     @home = Home.find(params[:id])
#   end

#   def update
#      if @home.update_attributes(home_params)
#       redirect_to home_path(@home)
#     else
#       render :edit
#     end
#   end

#   private 

#   def home_params
#     params.require(:home).permit(:title, :body, :image)
#   end

#   def set_post
#     @home = Home.find(params[:id])
#   end

 
end
