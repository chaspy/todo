class User < ApplicationRecord
  devise :trackable, :omniauthable, omniauth_providers: %i(google)
  has_many :tasks
  has_many :tags

  protected
  def self.find_for_google(auth)
    user = User.find_by(email: auth.info.email)

    unless user
      user = User.create(email: auth.info.email,
                         encrypted_password: Devise.friendly_token[0, 20])
    end
    user
  end
end
