require 'client'

module SilverPop
  class << self
    # Alias for SilverPop::Client.new
    #
    # @return [SilverPop::Client]
    def new(options={})
      SilverPop::Client.new(options)
    end

    # Delegate to SilverPop::Client.new
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end

