class AlbumAttachment < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :album
end
