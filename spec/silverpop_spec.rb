require 'helper'

describe SilverPop do
  describe ".new" do
    it "should be a new SilverPop::Client" do
      SilverPop.new.should be_a SilverPop::Client
    end
  end

  describe ".respond_to?" do
    it "should be true if method exists" do
      expect(SilverPop.respond_to?(:new, true)).to be_true
    end
  end
end
