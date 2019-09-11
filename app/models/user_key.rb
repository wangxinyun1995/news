class UserKey < ApplicationRecord
	belongs_to :user

  before_create :generate_access_token

  private

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
      self.expires_at = Time.now + 1.day
    end while self.class.exists?(access_token: self.access_token)
  end
end
