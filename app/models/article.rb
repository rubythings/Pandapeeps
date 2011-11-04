class Article
  include Mongoid::Document
  field :body
  field :title
  field :publication_date, :type => Date
  field :image
  embeds_many :comments
  has_and_belongs_to_many :people
   mount_uploader :image, ImageUploader
  has_and_belongs_to_many :pandas
end
