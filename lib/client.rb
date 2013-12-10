require 'silverpop/connection'
require 'silverpop/request'
require 'client/contact'

module SilverPop
  class Client
    def initialize(options={})
      @access_token = options[:access_token]
      @silverpop_url = options[:url]
    end

    include SilverPop::Connection
    include SilverPop::Request
    include SilverPop::Client::Contact
  end
end
