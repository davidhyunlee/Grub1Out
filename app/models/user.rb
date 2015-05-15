class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/
  has_many :identities, dependent: :destroy
  has_many :likes
  has_many :menu_items, through: :likes
  has_and_belongs_to_many :businesses
  has_many :reviews
  has_many :business_photos

  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         # :omniauth_providers => [:facebook, :twitter]
         validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

         def self.find_for_oauth(auth, signed_in_resource = nil)

          identity = Identity.find_for_oauth(auth)

          user = signed_in_resource ? signed_in_resource : identity.user

          if user.nil?

            email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
            email = auth.info.email if email_is_verified
            user = User.where(:email => email).first if email

            if user.nil?
              user = User.new(
                name: auth.extra.raw_info.name,
                email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
                password: Devise.friendly_token[0, 20],
                username: auth.info.nickname,
                first_name: auth.info.first_name,
                last_name: auth.info.last_name,
                image: auth.info.image
                )
              user.skip_confirmation!
              user.save!
            end
          end

          if identity.user != user
            identity.user = user
            identity.save!
          end
          user
        end
#   def email_verified?
#     self.email && self.email !~ TEMP_EMAIL_REGEX
#   end
# end


# def self.from_omniauth(auth)
#   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
#     user.email = auth.info.email
#     user.name = auth.info.name
#     user.username = auth.info.nickname
#     user.password = Devise.friendly_token[0,20]
#       user.first_name = auth.info.first_name   # assuming the user model has a name
#       user.last_name = auth.info.last_name   # assuming the user model has a name
#       user.image = auth.info.image # assuming the user model has an image
#       user.oauth_token = auth.credentials.oauth_token
#       user.oauth_expires_at = Time.at(auth.credentials.expires_at)
#     end
#   end

#   def password_required?
#     super && provider.blank?
#   end

  # def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
  #   data = access_token.info
  #   user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
  #   if user
  #     return user
  #   else
  #     registered_user = User.where(:email => access_token.info.email).first
  #     if registered_user
  #       return registered_user
  #     else
  #       user = User.create(name: data["name"],
  #         provider:access_token.provider,
  #         email: data["email"],
  #         uid: access_token.uid ,
  #         password: Devise.friendly_token[0,20]
  #         )
  #     end
  #   end
  # end
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
end

