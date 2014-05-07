module ApplicationHelper
  def title(page_title)
    content_for :title, page_title.to_s.capitalize
  end

  def mark_required(object, attribute)  
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator  
  end 
end
