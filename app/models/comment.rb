class Comment
  include Mongoid::Document
  field :body
  field :score
  validates :body, :presence => true
  embedded_in :article, :inverse_of => :comments
end
