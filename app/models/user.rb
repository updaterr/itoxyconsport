class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :project_strongs


  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates_length_of :first_name, :minimum => 2, :maximum => 20
  validates_length_of :last_name, :minimum => 2, :maximum => 20
  validates_uniqueness_of :email

end
