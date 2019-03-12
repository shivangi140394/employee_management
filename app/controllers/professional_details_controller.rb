class ProfessionalDetailsController < ApplicationController
  
  def index
    @professional_detail = ProfessionalDetail.all
  end

  def new
    @professional_detail = ProfessionalDetail.new
    @images = @professional_detail.images.new
  end

  def create
    @professional_detail =  ProfessionalDetail.create(professional_detail_params)
    binding.pry
    redirect_to root_path
  end

  private

    def professional_detail_params
      params.require(:professional_detail).permit(:name, :total_experience, :images_attributes=> [:name])
    end
end
