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

    attr_accessible :title, :description, :torrent_url, :image_urls, :steps, :updated_at, :featured_at
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