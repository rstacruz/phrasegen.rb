require 'minitest/autorun'

require File.expand_path('../../lib/phrasegen.rb', __FILE__)

describe "Phrasegen" do
  it "should work" do
    generated = 10.times.map { |i| Phrasegen.new.from_str(i) }

    assert 10, generated.size
    generated.each_with_index do |str, i|
      assert str.split(' ').size == 4

      generated.each_with_index do |str2, j|
        assert str != str2  if i != j
      end
    end
  end
end
