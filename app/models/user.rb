class User < ActiveRecord::Base
  rolify
  after_create :assign_role

  def assign_role
    add_role(:visitor)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_voter
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :pins, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_attached_file :profileavatar, styles: { medium: '152x152#' }
  validates_attachment_content_type :profileavatar, content_type: /\Aimage\/.*\Z/
end
