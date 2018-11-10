class User < ApplicationRecord
  rolify
  attr_writer :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tickets, through: :ticket_options

  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username
  validates :date_of_birth, presence: :true
  validates :gender, presence: :true,
            inclusion: { in: %w(Male Female) , message: "%{value} is not a valid gender" }
  validates :first_name, presence: :true
  validates :last_name, presence: :true
  validate :validate_age


  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_h).first
    end
  end

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def validate_age
    if date_of_birth.present? && date_of_birth > Date.today - 19.years
      errors.add(:base, "Sorry, you are not old enough to sign up.")
    end
  end
end
