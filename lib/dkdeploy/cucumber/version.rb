module Dkdeploy
  module Cucumber
    # Class for version number
    #
    class Version
      MAJOR = 4
      MINOR = 1
      PATCH = 0

      def self.to_s
        "#{MAJOR}.#{MINOR}.#{PATCH}"
      end
    end
  end
end
