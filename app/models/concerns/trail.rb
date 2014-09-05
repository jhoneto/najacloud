module Trail
  extend ActiveSupport::Concern
  
  included do
    has_paper_trail class_name: 'NajaTrail'
  end
end

