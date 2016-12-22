class Pin < ActiveRecord::Base
  acts_as_votable
  validates :user_id, presence: true
  include Impressionist::IsImpressionable
  is_impressionable
  has_attached_file :image, :styles => { medium: "300x300>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  resourcify
  belongs_to :user

  def impression_count
    impressions.size
  end

  def unique_impression_count
    impressions.group(:ip_address).size #UNTESTED: might not be correct syntax
  end
end
