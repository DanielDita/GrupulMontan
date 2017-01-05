class Event < ActiveRecord::Base
  acts_as_votable
  validates :user_id, presence: true
  has_attached_file :image, :styles => { large: "1400x1400>", medium: "300x300>", thumb: "300x100"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  :default_url => "**********",
                :storage => :s3,
                :bucket => 'grupulmontan',
                :s3_credentials => S3_CREDENTIALS
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
