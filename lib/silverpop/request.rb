module SilverPop
  module Request
    def post(path, options={})
      request(:post, path, options)
    end

    private

    # POST the XML to the SilverPop end point.
    #
    # @param body [String] The formatted XML of the API call make sure to call builder.to_xml.
    # @return [XML] XML Body from the API call
    def request(method, body, options)
      response = connection.send(method) do |request|
        request.url "/XMLAPI", options.merge(key: @key)
        request.headers['Content-type'] = "text/xml"
        request.body = body
      end
      response.body
    end
  end
end
