require 'ugcleague/version'
require 'ugcleague/configuration'
require 'ugcleague/error'
require 'ugcleague/request'
require 'ugcleague/api'
require 'ugcleague/client'

module UGC
    extend Configuration

    def self.client(options={})
        UGC::Client.new(options)
    end

    def self.method_missing(method, *args, &block)
        return super unless client.respond_to?(method)
        client.send(method, *args, &block)
    end

    def self.respond_to?(method)
        return client.respond_to?(method) || super
    end

end
