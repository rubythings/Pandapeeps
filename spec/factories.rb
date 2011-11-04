Factory.define :user do |f|
  f.name "foo"
  f.password "foobar"
  f.password_confirmation { |u| u.password }
  f.email "foo@example.com"
end

Factory.define :panda do |f|
  f.name "Su Lin"
  f.capture DateTime.now
  f.sex 'M'
end
Factory.define :comment do |f|
  f.body "foo"
end
Factory.define :article do |f|
  f.body "foo"
  f.title "foobar"
  f.publication_date DateTime.now
   f.comments { [Factory.build(:comment)]}
end



Factory.define :person do |f|
  f.name "fred"
end
