class User < ActiveRecord::Base

  has_and_belongs_to_many :roles
  has_many :devices
  has_many :news_posts, class_name: 'News::Post', foreign_key: :user_id

  # Include default devise modules. Others available are:
  # :database_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  #attr_accessor :login

  # def login=(login)
  #   @login = login
  # end
  #
  # def login
  #   @login || self.username || self.email
  # end
  #
  # def self.find_for_database_authentication(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:login)
  #     where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #   else
  #     where(conditions).first
  #   end
  # end

  include Gravtastic
  gravtastic

  def role? ( role )
    return !! self.roles.find_by_name(role.to_s.camelize)
  end

  def full_name
    "#{self.firstname} #{self.lastname}"
  end

  # Called before the ldap record is saved automatically
  def ldap_before_save
    self.email = Devise::LDAP::Adapter.get_ldap_param(self.username, "mail").first
    self.encrypted_password = Devise::LDAP::Adapter.get_ldap_param(self.username, "userPassword").first
    display_name = Devise::LDAP::Adapter.get_ldap_param(self.username, "displayName" )
    if display_name.present?
      display_name = display_name.first.split(' ')
      self.firstname = display_name[1]
      self.lastname = display_name.shift
    end
  end

  # hack for remember_token
  def authenticatable_token
    Digest::SHA1.hexdigest(email)[0,29]
  end

end
