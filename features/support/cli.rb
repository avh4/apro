module CliHelpers
  def apro_cmd
    @apro_cmd ||= File.expand_path(File.dirname(__FILE__) + "/../../../../bin/apro")
  end
end

World { |world| world.extend CliHelpers }
