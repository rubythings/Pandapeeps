require File.dirname(__FILE__) + '/../spec_helper'

describe Panda do
  it "should be valid" do
    Panda.new.should be_valid
  end
end
