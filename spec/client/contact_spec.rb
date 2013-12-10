require 'helper'

describe SilverPop::Client::Contact do
  before do
    @client = SilverPop::Client.new({access_token: "abc123",url: 'https://api1.silverpop.com'})
  end

  describe "#add_recipient" do
    it "should add a recipient to an existing database" do
      stub_request(:post, "https://api1.silverpop.com/XMLAPI?access_token=abc123").
        with(:body => "<Envelope><Body><AddRecipient><LIST_ID>123</LIST_ID><CREATED_FROM>1</CREATED_FROM><CONTACT_LISTS><CONTACT_LIST_ID>456</CONTACT_LIST_ID></CONTACT_LISTS><COLUMN><NAME>email</NAME><VALUE>test@example.com</VALUE></COLUMN></AddRecipient></Body></Envelope>").
          to_return(:status => 200, :body => "<Envelope><Body><RESULT><SUCCESS>TRUE</SUCCESS><RecipientId>12345</RecipientId><ORGANIZATION_ID>xyz257</ORGANIZATION_ID></RESULT></Body></Envelope>", :headers => {'Content-type' => "text/xml"})

      resp = @client.add_recipient({email:"test@example.com"}, 123, [456])
      resp.Envelope.Body.RESULT.SUCCESS.should eql "TRUE"
    end

    it "should add a recipient to an existing database with options" do
      stub_request(:post, "https://api1.silverpop.com/XMLAPI?access_token=abc123").
        with(:body => "<Envelope><Body><AddRecipient><LIST_ID>123</LIST_ID><CREATED_FROM>1</CREATED_FROM><CONTACT_LISTS><CONTACT_LIST_ID>456</CONTACT_LIST_ID></CONTACT_LISTS><UPDATE_IF_FOUND>true</UPDATE_IF_FOUND><COLUMN><NAME>email</NAME><VALUE>test@example.com</VALUE></COLUMN></AddRecipient></Body></Envelope>").
          to_return(:status => 200, :body => "<Envelope><Body><RESULT><SUCCESS>TRUE</SUCCESS><RecipientId>12345</RecipientId><ORGANIZATION_ID>xyz257</ORGANIZATION_ID></RESULT></Body></Envelope>", :headers => {'Content-type' => "text/xml"})

      resp = @client.add_recipient({email:"test@example.com"}, 123, [456], 1, {UPDATE_IF_FOUND: "true"})
      resp.Envelope.Body.RESULT.SUCCESS.should eql "TRUE"
    end

  end
end
