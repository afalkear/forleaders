class StaticPagesController < ApplicationController
  def home
    @articles = Article.all
    @articles_number = 6
    @articles_columns = 3
    @articles_rows = 2
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
  
  def about
  end

  def contact
  end

  def news
  end
end
