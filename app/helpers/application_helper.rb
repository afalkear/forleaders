module ApplicationHelper
  def title(page_title)
    normalized_title = ActionView::Base.full_sanitizer.sanitize(page_title).capitalize
    normalized_title.gsub! 'Derose', 'DeRose'
    normalized_title.gsub! 'For leaders', 'For Leaders'
    normalized_title.gsub! 'method', 'Method'
    normalized_title.gsub! 'método', 'Método'
    content_for :title, normalized_title
  end

  def locale_logo
    #available_locales = %w(es pt fr en)
    #image = (available_locales.include? I18n.locale.to_s.downcase) ? "logo_mdl_#{I18n.locale.to_s.downcase}.png" : "logo_mdl.png"
    image = "logo_derose_method.png"
    image_tag image, class: "center"
  end

  def locale_image(options = {})
    available_locales = %w(es pt fr en)
    image = (available_locales.include? I18n.locale.to_s.downcase) ? "#{options[:name]}_#{I18n.locale.to_s.downcase}.#{options[:extension]}" : "#{options[:name]}.#{options[:extension]}"
    image_tag image, class: "#{options[:class]}"
  end

  def mark_required(object, attribute)  
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator  
  end 

  def youtube_embed(youtube_url, width, height)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    %Q{<iframe title="YouTube video player" width="#{width}" height="#{height}" src="http://www.youtube.com/embed/#{ youtube_id }?modestbranding=1&autohide=1&controls=2&showinfo=0&rel=0" frameborder="0" allowfullscreen>
    </iframe>}
  end

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'current' : nil

    content_tag(:li, :class => class_name) do
      link_to (raw link_text), link_path
    end
  end
end
