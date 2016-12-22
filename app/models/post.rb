class Post < ActiveRecord::Base
  resourcify
  include Impressionist::IsImpressionable
  is_impressionable
  acts_as_votable
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  has_attached_file :image, :styles => { large: "1400x1400>", medium: "300x300>", thumb: "150x150"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user

  def impression_count
    impressions.size
  end

  def unique_impression_count
    impressions.group(:ip_address).size #UNTESTED: might not be correct syntax
  end


end
