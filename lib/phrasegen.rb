class Phrasegen
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
    hash = derive(str)
    digits = max.to_s(16).size
    hashes = hash.to_s.scan(/.{#{digits}}/)[0...count]
    hashes.map { |h| h.to_i(16) * max / (16**digits) }
  end

  # Derives a key from a master password by hashing it multiple times with
  # different salts to prevent rainbow table attacks.
  # See: https://en.wikipedia.org/wiki/PBKDF2
  #
  #    PhraseGen.new.derive('hello', 2000)
  #    #=> '8a82bc24dea34...'
  #
  def derive(str, iters=2000)
    require 'digest/sha2'

    hash = str
    iters.times do |i|
      hash = Digest::SHA2.new << (hash.to_s.downcase + salt(i))
    end
    hash
  end

  # Returns a salt for iteration number `i` of given length `len`. Salts are
  # used in derivation.
  def salt(i, len=64)
    salt = ''
    loop do
      salt += dict[i]
      return salt if salt.size >= len
      i += 1
    end
  end

  # Returns an array of words.
  def dict
    require File.expand_path('../phrasegen/words.rb', __FILE__)
    WORDLIST
  end
end

require File.expand_path('../phrasegen/version.rb', __FILE__)
