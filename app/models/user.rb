class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JWTBlacklist

  validates :email, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true,
            email: true
end
