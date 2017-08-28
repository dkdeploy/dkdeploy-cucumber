# Navigation helper module for cucumber steps
#
module NavigationHelpers
  # Mapping for path names to real remote path
  #
  # @param path [String]
  # @return [String]
  def path_to(path)
    path
  end
end

World(NavigationHelpers)
