class StaticPagesController < ApplicationController
  layout "static_pages"
  
  def home
    if user_signed_in? && !current_user.nil? && (current_user.role? "translator") && ((current_user.debug_translations == "missing") || (current_user.debug_translations == "all"))
      expire_fragment('home')
    end
    @articles = Article.includes(:categories).page(1).per(6)
    @articles_number = @articles.count
    @articles_columns = 3
    @articles_rows =  @articles.count > 2 ? 2 : 0
  end

  def individual_consultory
    if user_signed_in? && !current_user.nil? && (current_user.role? "translator") && ((current_user.debug_translations == "missing") || (current_user.debug_translations == "all"))
      expire_fragment('individual_consultory')
    end
  end

  def group_consultory
    if user_signed_in? && !current_user.nil? && (current_user.role? "translator") && ((current_user.debug_translations == "missing") || (current_user.debug_translations == "all"))
      expire_fragment('group_consultory')
    end
  end

  def the_method
  end

  def our_consultors
    if user_signed_in? && !current_user.nil? && (current_user.role? "translator") && ((current_user.debug_translations == "missing") || (current_user.debug_translations == "all"))
      expire_fragment('our_consultors')
    end
  end

  def derose_method
    if user_signed_in? && !current_user.nil? && (current_user.role? "translator") && (!current_user.debug_translations.blank?)
      expire_fragment('derose_method')
    end
  end

  def institution_testimonials
    if user_signed_in? && !current_user.nil? && (current_user.role? "translator") && ((current_user.debug_translations == "missing") || (current_user.debug_translations == "all"))
      expire_fragment('institution_testimonials')
    end
  end

  def enterprise_testimonials
    if user_signed_in? && !current_user.nil? && (current_user.role? "translator") && ((current_user.debug_translations == "missing") || (current_user.debug_translations == "all"))
      expire_fragment('enterprise_testimonials')
    end
  end

  def apply
    @apply_message = ApplyMessage.new
  end

  def apply_message
    @apply_message = ApplyMessage.new(params[:apply_message])

    if @apply_message.valid?
      ApplyMailer.new_apply_form(@apply_message).deliver
      redirect_to apply_url, notice: "Message sent. Thank you for contacting us."
    else
      redirect_to apply_url, notice: "Please fill all required fields."
    end
  end

  def contact
    @contact_message = ContactMessage.new
  end

  def contact_message
    @contact_message = ContactMessage.new(params[:contact_message])

    if @contact_message.valid?
      ContactMailer.new_contact_form(@contact_message).deliver
      redirect_to contact_url, notice: "Message sent. Thank you for contacting us."
    else
      redirect_to contact_url, notice: "Please fill all required fields."
    end
  end

  def net
    if user_signed_in? && !current_user.nil? && (current_user.role? "translator") && ((current_user.debug_translations == "missing") || (current_user.debug_translations == "all"))
      expire_fragment('net')
    end
  end
end
