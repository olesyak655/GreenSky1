class Admin < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :role

  before_save :encrypt_password, :add_role_to_admin

  attr_accessor :password, :role

  belongs_to :role

  validates :email, presence: true
  validates_uniqueness_of :email
  validates_presence_of :password, :on => :create
  validates :password, confirmation: true


  def self.authenticate(email, password)
    admin = Admin.find_by_email(email)
    if admin && admin.password_hash == BCrypt::Engine.hash_secret(password,admin.password_salt)
      admin
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

  def add_role_to_admin
    r = Role.find_by_role_code(role)
    self.role_id = r.id
  end

end
