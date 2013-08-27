#!/usr/bin/env ruby

require "bundler/setup"
require "pp"
require 'minitest/autorun'


class String
  def good?
    self.match /\w+/
  end
end

class TestMeme < MiniTest::Unit::TestCase

  def setup
    @good_examples=[
      "cat",
      "kategorija",
      "kategorija kategorija"
    ]

    @bad_examples=[
      "cat cat cat",
      "dolgadolgadolga dolgadolgadolga"
    ]
  end

  def test_good_examples
    @good_examples.each do |e|
      assert e.good?
    end
  end

  def test_bad_examples
    @bad_examples.each do |e|
      assert_equal true, (e.good? == true)
    end
  end

end

