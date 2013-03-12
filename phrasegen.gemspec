require './lib/phrasegen/version'

Gem::Specification.new do |s|
  s.name = "phrasegen"
  s.version = Phrasegen.version
  s.summary = %[Generates a passphrase from a given input string.]
  s.description = %[Phrasegen generates long phrases from common words from a given master password.]
  s.authors = ["Rico Sta. Cruz"]
  s.email = ["rico@sinefunc.com"]
  s.homepage = "http://github.com/rstacruz/phrasegen.rb"
  s.files = `git ls-files`.strip.split("\n")
  s.executables = Dir["bin/*"].map { |f| File.basename(f) }

  s.add_dependency "clipboard"
  s.add_dependency "highline"
end
