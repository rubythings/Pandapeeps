require File.dirname(__FILE__) + '/../spec_helper'

describe Comment do
  it "should be valid" do
    Comment.new.should_not be_valid
    Comment.new(:body=>'test').should be_valid
  end
end
