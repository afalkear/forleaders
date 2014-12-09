class Author < ActiveRecord::Base
  mount_uploader :avatar, ImageUploader
  validates_presence_of :last_name
  has_many :articles

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
