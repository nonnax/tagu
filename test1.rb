#!/usr/bin/env ruby
# Id$ nonnax 2022-04-25 19:29:03 +0800
require "minitest/autorun"
require_relative 'lib/tagu'

class TaguTest < MiniTest::Test 

  def test_normal
    # assert_instance_of(cls, obj, msg = nil)
    # assert_respond_to(object, some_method)
    assert_instance_of tagu{}.class, 'string', "should be String"    
  end

  # more test here
  #

end

pp MiniTest::Test.instance_methods(true).sort
