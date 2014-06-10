class Role < ActiveRecord::Base
  attr_accessible :role_code, :role_name
  #has_many :admins
  #has_many :users
end
