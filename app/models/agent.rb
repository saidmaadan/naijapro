class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # attr_writer :login
  # before_save :set_slug
  has_one_attached :avatar

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,  omniauth_providers: [:facebook, :google_oauth2]
        #  authentication_keys: [:login]
        

  validates :fullname, presence: true, length: {maximum: 50}
  validates :lastname, presence: true, length: {maximum: 50}  
  validates :username, uniqueness: true
  #validates :username, presence: true, uniqueness: { case_sensitive: false }
  # validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  # validate :validate_username

  # def validate_username
  #   if Agent.where(email: username).exists?
  #     errors.add(:username, :invalid)
  #   end
  # end

  # def login
  #   @login || self.username || self.email
  # end

  # def to_param
  #   slug
  # end

  # def self.find_for_database_authentication(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #   elsif conditions.has_key?(:username) || conditions.has_key?(:email)
  #     where(conditions.to_hash).first
  #   end
  # end

  def self.from_omniauth(auth)
    full_name = auth.info.name.split(" ")
    email_username = auth.info.email.split(/@/)
    agent = Agent.where(email: auth.info.email).first

    if agent
      if !agent.provider
        agent.update(uid: auth.uid, provider: auth.provider, image: auth.info.image)
      end
      return agent
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |agent|
        agent.email = auth.info.email
        agent.username = email_username[0]
        agent.password = Devise.friendly_token[0, 20]
        agent.fullname= full_name[0] 
        agent.lastname= full_name[1]
        # agent.fullname = auth.info.name   # assuming the agent model has a name
        agent.image = auth.info.image # assuming the agent model has an image

        agent.uid = auth.uid
        agent.provider = auth.provider

        # agent.skip_confirmation!
      end
    end
  end

  
  private

  # def set_slug
  #   self.slug = username.parameterize
  # end
end
