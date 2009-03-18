require File.dirname(__FILE__) + "/../../lib/apro"

require 'cucumber'
require 'spec'

require 'rubigen'
require 'rubigen/helpers/generator_test_helper'
include RubiGen::GeneratorTestHelper

SOURCES = Dir[File.dirname(__FILE__) + "/../../*_generators"].map do |f|
  RubiGen::PathSource.new(:test, File.expand_path(f))
end