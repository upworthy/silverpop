require 'silverpop/connection'
require 'silverpop/request'
require 'client/contact'

module SilverPop
  class Client
    def initialize(access_token, options={})
      @access_token = access_token
    end

    include SilverPop::Connection
    include SilverPop::Request
    include SilverPop::Client::Contact
  end
end
