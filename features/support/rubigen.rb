module RubiGenHelpers
  def install_generators(name)
    generators_path = File.expand_path(File.dirname(__FILE__) + "/../../#{name}")
    in_home_folder do
      FileUtils.mkdir_p(".rubigen")
      FileUtils.cp_r(generators_path, ".rubigen/")
    end
  end
end

World { |world| world.extend RubiGenHelpers }
