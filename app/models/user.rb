class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation

  before_save :encrypt_password, :add_role_to_user

  attr_accessor :password

  belongs_to :role

  validates :email, presence: true
  validates_uniqueness_of :email
  validates_presence_of :password, :on => :create
  validates :password, confirmation: true

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password,user.password_salt)
      user
    else
      nil
    end

  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
    end
  end

  def add_role_to_user
    r = Role.find_by_role_code(3)
    self.role_id = r.id
  end
end
