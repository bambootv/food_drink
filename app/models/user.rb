class User < ApplicationRecord
  attr_accessor :remember_token
  before_save :email_downcase
  enum role: [:admin, :user, :guest]

  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :ratings, dependent: :destroy
  validates :name, length: {maximum: Settings.user.maxname}, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, allow_blank: true
  validates :address, :phone, presence: true
  has_secure_password

  self.per_page = 10

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end
  end

  def is_user? user
    self == user
  end

  def remember
    self.remember_token = new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute :remember_digest, nil
  end

  private

  def email_downcase
    email.downcase!
  end

  def new_token
    SecureRandom.urlsafe_base64
  end
end
