require 'spec_helper'

describe User do
 
  describe User do
  it "should be valid" do
    User.new.should_not be_valid
    User.new(:name => 'john').should_not be_valid
    User.new(:name => 'john', :email=>'a@b.com').should_not be_valid
    User.new(:name => 'john', :password=>'summat', :email=>'a@b.com').should_not be_valid
    User.new(:name => 'john', :email=>'a@b.com', :password=>'summat', :password_confirmation=>'summat').should be_valid
  end
end
end
