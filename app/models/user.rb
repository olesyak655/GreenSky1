class User < ActiveRecord::Base

  include Autorization

  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation

  before_save :encrypt_password, :add_role_to_user

  attr_accessor :password, :old_password

  #belongs_to :role

  validates :email, presence: true
  validates_uniqueness_of :email
  validates_presence_of :password, :on => :create
  validates :password, confirmation: true

  def add_role_to_user
    r = Role.find_by_role_code(3)
    self.role_id = r.id
  end

  def self.search(search)
    if search
      where('first_name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
