class PhraseGen
  # Generates a phrase from a string.
  #
  #     PhraseGen.new.from_str('facebook.com hello_there', 4)
  #     #=> "correct horse battery staple"
  #
  def from_str(str, count=4)
    d = digest(str, count)
    d.map { |i| dict[i] }.join(' ')
  end

  # Returns a digest of `count` numbers, each number with a maximum of `max`.
  #
  #     PhraseGen.new.digest('facebook.com hello_there', 4)
  #     #=> [3928, 49, 1948, 5821]
  #
  def digest(str, count, max=dict.length)
    require 'digest/sha2'
    hash = Digest::SHA2.new << str
    digits = max.to_s(16).size
    hashes = hash.to_s.scan(/.{#{digits}}/)[0...count]
    hashes.map { |h| h.to_i(16) * max / (16**digits) }
  end

  # Returns an array of words.
  def dict
    require File.expand_path('../phrase_gen/words.rb', __FILE__)
    WORDLIST
  end
end

module PhraseGen::Helpers
  def askpass(msg)
    if ARGV.include?('-s')
      require 'highline'
      HighLine.new.ask(msg) { |q| q.echo = '*' }
    else
      print msg
      STDIN.readline[0...-1]
    end
  end
end
