lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ugcleague/version'

Gem::Specification.new do |gem|
    gem.name            = "ugcleague"
    gem.version         = UGCLeague::VERSION
    gem.authors         = ["Ranndom"]
    gem.email           = ["Ranndom@rnndm.xyz"]
    gem.description     = %q{Ruby client for UGC League API}
    gem.summary         = %q{Ruby client for UGC League API}
    gem.homepage        = "https://github.com/Ranndom/UGCLeague"

    gem.files           = `git ls-files`.split($/)
    gem.require_paths   = ["lib"]

    gem.add_runtime_dependency 'httparty'
end
