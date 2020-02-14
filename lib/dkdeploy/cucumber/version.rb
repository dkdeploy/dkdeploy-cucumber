# frozen_string_literal: true

module Dkdeploy
  module Cucumber
    # Class for version number
    #
    class Version
      MAJOR = 4
      MINOR = 1
      PATCH = 1
      SUFFIX = ''

      def self.to_s
        "#{MAJOR}.#{MINOR}.#{PATCH}#{SUFFIX}"
      end
    end
  end
end
