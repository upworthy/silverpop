require 'faraday_middleware'

module SilverPop
  # @private
  module Connection
    private

    def connection(options={})
      connection = Faraday.new @silverpop_url do |conn|
        # Uncomment if want to log to stdout
        #conn.response :logger

        conn.request :oauth2, @access_token
        conn.request :url_encoded
        conn.response :mashify

        conn.response :xml, :content_type => /\bxml$/
        conn.adapter Faraday.default_adapter
      end
      connection
    end
  end
end
