module Public::BaseHelper
  def classes_for_scoped_css
    "main-layout <%= params[:controller].parameterize %>-controller <%= params[:action].parameterize %>-action"
  end
end
