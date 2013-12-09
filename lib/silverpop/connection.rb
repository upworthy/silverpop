require 'faraday_middleware'

module SilverPop
  # @private
  module Connection
    private

    def connection(options={})
      connection = Faraday.new(options.merge({url: 'https://api1.silverpop.com'})) do |builder|
        # Uncomment if want to log to stdout
        #builder.response :logger

        builder.use FaradayMiddleware::OAuth2, @access_token
        builder.use Faraday::Request::UrlEncoded
        builder.use Faraday::Response::Mashify
        #builder.use FaradayMiddleware::ParseXml,  :content_type => /\bxml$/
        builder.adapter Faraday.default_adapter
      end
      connection
    end
  end
end
