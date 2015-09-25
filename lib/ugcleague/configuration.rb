module UGC
    module Configuration

        VALID_OPTIONS_KEYS = [:api_key, :user_agent].freeze

        DEFAULT_USER_AGENT = "UGC League Ruby Gem #{UGC::VERSION}".freeze

        attr_accessor(*VALID_OPTIONS_KEYS)

        def self.extended(base)
            base.reset
        end

        def configure
            yield self
        end

        def options
            VALID_OPTIONS_KEYS.inject({}) do |option, key|
                option.merge!(key => send(key))
            end
        end

        def reset
            self.api_key = ENV['UGC_LEAGUE_API_KEY']
            self.user_agent = DEFAULT_USER_AGENT
        end

    end
end
