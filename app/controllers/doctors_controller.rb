class DoctorsController < InheritedResources::Base

  has_scope :by_name

  def create
    create! do |success, failure|
      success.html { redirect_to doctors_path }
    end
  end

  def permitted_params
    params.permit(doctor: [:name, :birthdate, :phone])
  end

end
