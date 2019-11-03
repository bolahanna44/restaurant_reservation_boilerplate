# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validate :role_validity

  has_many :restaurants
  has_many :reservations
  has_many :restaurant_reservations, through: :restaurants, source: :reservations

  def restaurant?
    role == 'restaurant'
  end

  def admin?
    role == 'admin'
  end

  def guest?
    role == 'guest'
  end

  private

  def role_validity
    errors.add(:role, 'not valid') unless %w[guest restaurant admin].include? self.role
  end
end
