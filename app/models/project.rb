class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :description, type: String
  field :upvotes, type: Integer, default: 0
  field :downvotes, type: Integer, default: 0
  field :torrent_url, type: String
  field :image_urls, type: Array
  field :featured_at, type: Time
  field :creator, type: String

  # referenced relations
  #has_one :creator, :inverse_of => :user
  has_and_belongs_to_many :tags, inverse_of: nil
  belongs_to :user, inverse_of: :projects

  # embedded relations
  embeds_many :steps
  embeds_many :comments

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :creator
  validates_presence_of :upvotes
  validates_presence_of :downvotes

  validates_length_of :title, maximum: 50
  validates_length_of :description, minimum: 50
  validates_numericality_of :upvotes, greater_than_or_equal_to: 0
  validates_numericality_of :downvotes, greater_than_or_equal_to: 0
  attr_accessible :title, :description, :torrent_url, :image_urls, :steps, :featured_at, :upvotes, :downvotes

  def self.recently_created
    # 864000 seconds = 10 days
    where({:created_at.gte => 10.days.ago}).desc(:created_at)
  end

  def self.recently_updated
    # 864000 seconds = 10 days
    where({:updated_at.gte => 10.days.ago}).desc(:created_at)
  end
end

class Comment
  include Mongoid::Document
  field :body
  has_one :commentor, class_name: User
  embedded_in :project, inverse_of: :comments
end

class Step
  include Mongoid::Document
  field :title
  field :image_urls
  field :body
  field :video_url

  embedded_in :project, inverse_of: :steps
end

class Tag
  include Mongoid::Document
  field :name, type: String
end