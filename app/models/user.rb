class User < ApplicationRecord
  has_secure_password

  attr_accessor :is_password_updated

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { in: 8..16 }, if: :should_validate_password?
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  # @return [Boolean]
  def should_validate_password?
    is_password_updated
  end

  # @return [String] JWT認証トークン
  def auth_token
    Knock::AuthToken.new(payload: { sub: id }).token
  end
end
