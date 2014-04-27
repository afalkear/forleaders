class ApplyMessage
  include ActiveAttr::Model

  attribute :civility
  attribute :first_name
  attribute :last_name
  attribute :email
  attribute :birthdate
  attribute :company
  attribute :position
  attribute :years_of_experience
  attribute :work_phone
  attribute :city
  attribute :country

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :company
  validates_presence_of :position
  validates_presence_of :city
  validates_presence_of :country

  validates_numericality_of :years_of_experience, allow_blank: true
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

end