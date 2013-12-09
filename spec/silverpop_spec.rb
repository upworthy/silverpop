require 'helper'

describe SilverPop do
  describe ".new" do
    it "should be a new SilverPop::Client" do
      SilverPop.new.should be_a SilverPop::Client
    end
  end
end
