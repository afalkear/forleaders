class StaticPagesController < ApplicationController
  def home
    @articles = Article.page(params[:page]).per(6)
    @articles_number = 6
    @articles_columns = 3
    @articles_rows =  @articles.count > 2 ? 2 : 0
  end

  def individual_consultory
  end

  def group_consultory
  end

  def the_method
  end

  def our_consultors
  end

  def derose_method
  end

  def institution_testimonials
  end

  def enterprise_testimonials
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
  end
end
