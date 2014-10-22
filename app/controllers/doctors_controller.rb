class DoctorsController < InheritedResources::Base

  has_scope :by_name

  def index
    @doctors = apply_scopes(Doctor.includes(:clinic)).all
    expires_in 1.minute, :public => true
  end

  def create
    create! do |success, failure|
      success.html { redirect_to doctors_path }
    end
  end

  def permitted_params
    params.permit(doctor: [:name, :birthdate, :phone])
  end

end
