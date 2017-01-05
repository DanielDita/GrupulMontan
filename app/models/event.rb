class Event < ActiveRecord::Base
  acts_as_votable
  validates :user_id, presence: true
  has_attached_file :image, :styles => { large: "1400x1400>", medium: "300x300>", thumb: "300x100"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  :url  => ":s3_domain_url",
  :path => "public/avatars/:id/:style_:basename.:extension",
  :storage => :fog,
  :fog_credentials => {
      provider: 'AWS',
      aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
  fog_directory: "grupulmontan"
  resourcify
  belongs_to :user
  include Impressionist::IsImpressionable
  is_impressionable


  def impression_count
    impressions.size
  end

  def unique_impression_count
    impressions.group(:ip_address).size #UNTESTED: might not be correct syntax
  end

  extend FriendlyId
  friendly_id :title, use: :slugged
end
