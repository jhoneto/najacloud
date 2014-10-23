class Public::DoctorsController < Public::BaseController
  inherit_resources
  has_scope :by_name

  def index
    @doctors = apply_scopes(Doctor.includes(:clinic)).all
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
