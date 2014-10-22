class DoctorPresenter < SimpleDelegator
  def name
    "Nome: " + super
  end

  def birthdate
    if super.nil?
      "-"
    else
      helpers.l(super)
    end

  end


  def helpers
    ActionController::Base.helpers
  end
end
