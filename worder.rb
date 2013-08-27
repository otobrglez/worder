#!/usr/bin/env ruby

require "bundler/setup"
require "pp"
require 'minitest/autorun'


class String
  def good?
    self.match /\A\S{1,10}(\ \S{1,10})?\z/
  end

  def bad?
    not good?
  end

end

class TestMeme < MiniTest::Unit::TestCase

  def test_expression
    assert "test".good?
    assert "test test".good?
    assert "Party 2000".good?
    assert "香港".good?
    assert "香港 香港".good?

    assert "test ".bad?
    assert "test  ".bad?
    assert "test\ntest".bad?
    assert "test test test".bad?
    assert "香港 香港 ".bad?
  end

end

