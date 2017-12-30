calss User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider    = auth['provider']
      user.uid         = auth['uid']
      user.screen_name = auth['info']['nickname']
      user.name        = auth['info']['name']
    end
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.username = auth.info.nickname
      user.email    = auth.info.email
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["device.user_attributes"], without_protection: true) do |user|
        user.attributes = params
	user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && procider.blank?
  end

  def update_with_password?(params, *options)
    if encrypted_passwrod.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  devise :database_authenticatable, :registerable,
	 :recoverable, :rememberable, :trackable, :validatable,
	 :omniauthable, omniauth_providers: [:twitter]

  validates :username, presence: true, uniqueness: true
  #https://github.com/plataformatec/devise/wiki/OmniAuth-with-multiple-models
end

