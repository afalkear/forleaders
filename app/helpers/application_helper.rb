module ApplicationHelper
  def title(page_title)
    content_for :title, page_title.to_s.capitalize
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
end
