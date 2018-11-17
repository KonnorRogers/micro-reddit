# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  has_many :comments

  validates :name,
            presence: true,
            length: { minimum: 3, maximum: 50 },
            uniqueness: { case_sensitive: false }

  # uses bcrypt to encrypt password as password_digest
  has_secure_password
end
