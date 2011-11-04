class Person
  include Mongoid::Document
  field :name
  field :nick
  field :rep, :type => Integer
  field :login
  field :email

  has_and_belongs_to_many :articles
end
