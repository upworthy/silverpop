require 'helper'

describe SilverPop::Client::RelationalTable do
  before do
    @client = SilverPop.new access_token: 'abc123', url: 'https://api1.silverpop.com'
  end

  describe '.insert_update_relational_table' do
    it 'returns the success as true' do
      stub_post('/XMLAPI?access_token=abc123')
      .with(body: '<Envelope><Body><InsertUpdateRelationalTable><TABLE_ID>86767</TABLE_ID><ROWS><ROW><COLUMN name="Record Id"><![CDATA[GHbjh73643hsdiy]]></COLUMN></ROW></ROWS></InsertUpdateRelationalTable></Body></Envelope>')
      .to_return status: 200,
                 body: fixture('relational_table.xml'),
                 headers: { 'Content-type' => 'text/xml' }

      resp = @client.insert_update_relational_table '86767', [{'Record Id' => 'GHbjh73643hsdiy'}]

      expect(resp.Envelope.Body.RESULT.SUCCESS).to eq('true')
    end
  end
end
