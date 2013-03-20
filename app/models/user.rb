class User
  include Mongoid::Document
  include Mongoid::Timestamps
  rolify
  authenticates_with_sorcery!

  attr_accessible :_id, :email, :password, :password_confirmation

  field :_id, type: String
  field :avatar_url, type: String

  validates_length_of :password, minimum: 3, message: "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, message: "should match confirmation", :if => :password
  validates_uniqueness_of :_id, message: "username #{:username} is already in use"
  validates_uniqueness_of :email, message: "email address #{:email} is already in use"


  has_many :projects
  has_many :comments
end
