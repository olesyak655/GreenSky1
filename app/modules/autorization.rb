module Autorization
    def self.included(base)
        base.extend(A)
    end

    def encrypt_password
    if password.present?

      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
    end
  end

  module A

        def authenticate(email, password)

            admin = Admin.find_by_email(email)
            user = User.find_by_email(email)

            if admin && admin.password_hash == BCrypt::Engine.hash_secret(password,admin.password_salt)
                admin
            else
                if user && user.password_hash == BCrypt::Engine.hash_secret(password,user.password_salt)
                    user
                else
                    nil
                end
            end

        end
   end

end
