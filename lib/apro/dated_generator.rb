module Apro
  class DatedGenerator < RubiGen::Base
    attr_reader :date, :year
    def initialize(runtime_args, runtime_options = {})
      super
      @date = Time.now.strftime("%Y-%m-%d")
      @year = Time.now.strftime("%Y")
    end
  end
end