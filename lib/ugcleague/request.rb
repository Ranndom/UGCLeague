require 'httparty'
require 'json'
require 'rack'

module UGCLeague
    class Request
        
        include HTTParty
        format :json
        headers 'Accept' => 'application/json'
        parser Proc.new { |body, _| parse(body) }

        attr_accessor :api_key

        def self.parse(body)
            begin
                JSON.load body
            rescue JSON::ParserError
                raise Error::Parsing.new "The response is not valid JSON"
            end
        end

        def get(options={})
            options[:key] = @api_key unless !@api_key
            query_string = Rack::Utils.build_query(options)

            debug_message("GET request for \"http://www.ugcleague.com/api/api.php?#{query_string}\" sent (using useragent \"#{@user_agent}\")")
            validate self.class.get("http://www.ugcleague.com/api/api.php?#{query_string}")
        end

        def validate(response)
            case response.body
                when "Access denied."; raise Error::Unauthorized.new "Invalid API key"
            end

            response.parsed_response
        end

        def debug_message(message)
            puts "DEBUG: #{message}" if @debug
        end

        private

        def error_message(response)
            parsed_response = response.parsed_response

            "Server responded with code #{response.code}. " \
            "Request URI: #{response.request.base_uri}#{response.request.path}"
        end

    end
end

