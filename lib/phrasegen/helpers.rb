class Phrasegen
  module Helpers
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
end
