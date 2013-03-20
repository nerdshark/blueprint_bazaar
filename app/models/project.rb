class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  resourcify

  field :title, type: String
  field :description, type: String
  field :upvotes, type: Integer, default: 0
  field :downvotes, type: Integer, default: 0
  field :torrent_url, type: String
  field :image_urls, type: Array
  field :featured_at, type: Time

  # referenced relations
  has_and_belongs_to_many :tags, inverse_of: nil
  belongs_to :creator, class_name: "User"
  has_many :comments

  # embedded relations
  embeds_many :steps

  embeds_many :tags

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

  resourcify

  field :body
  belongs_to :commentor, class_name: "User"
  validates_presence_of :body
  validates_presence_of :commentor
  belongs_to :project
  belongs_to :project
end

class Step
  include Mongoid::Document

  resourcify

  field :title
  field :image_urls
  field :body
  field :video_url

  embedded_in :project

  validates_presence_of :title
  validates_length_of :title, maximum: 50
  validates_presence_of :body
end

class Tag
  include Mongoid::Document

  resourcify

  field :name, type: String
end