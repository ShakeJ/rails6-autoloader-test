class User < ApplicationRecord
  validates :login, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 4 }, allow_nil: false, if: lambda{ new_record? || !password.nil? }
  has_secure_password validations: false

  has_one :login_token, dependent: :destroy
end
