require 'helper'

describe SilverPop::Client::Contact do
  before do
    @client = SilverPop::Client.new("abc123")
  end

  describe "#add_recipient" do
    it "should add a contact to the database" do
      @client.add_recipient.should eql true
    end

  end
end
