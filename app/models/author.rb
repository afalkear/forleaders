class Author < ActiveRecord::Base
  mount_uploader :avatar, ImageUploader
  validates_presence_of :last_name
end
