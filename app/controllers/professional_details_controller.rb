class ProfessionalDetailsController < ApplicationController
  

  def new
    @professional_detail = current_employee.build_professional_detail
  end

  def create
    @professionaldetail = current_employee.create_professional_detail(professional_detail_params)
    redirect_to root_path
  end

  private

    def professional_detail_params
      params.require(:professional_detail).permit(:total_experience, acadmic_details: [:name, :value])
    end
end
