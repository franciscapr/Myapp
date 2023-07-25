class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  enum role: { user: 0, admin: 1 }

  def admin?
    role == 'admin'
  end

  has_one_attached :profile_picture
  validates :relevant_data, presence: true

  has_many :postulations
  has_many :job_offers
end
