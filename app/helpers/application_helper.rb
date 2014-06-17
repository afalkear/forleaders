module ApplicationHelper
  def title(page_title)
    if page_title.to_s == "Método DeRose"
      content_for :title, "Método DeRose"
    else
      content_for :title, page_title.to_s.capitalize
    end
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
