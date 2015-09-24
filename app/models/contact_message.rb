class ContactMessage
  include ActiveAttr::Model

  attribute :first_name
  attribute :last_name
  attribute :email
  attribute :calendar
  attribute :company
  attribute :position
  attribute :phone
  attribute :observations
  attribute :school

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

end