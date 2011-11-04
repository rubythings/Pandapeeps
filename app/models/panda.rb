class Panda 
  include Mongoid::Document

  field :name, :type => String, :required => true
  field :capture, :type => DateTime
  field :sex, :type =>Integer
  field :lat, :type => Float
  field :long, :type => Float

  has_and_belongs_to_many :articles
end
