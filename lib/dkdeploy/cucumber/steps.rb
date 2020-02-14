# frozen_string_literal: true

# Loads steps from directory `./step_definitions'.
Dir.glob(File.expand_path('step_definitions/*.rb', __dir__)).each { |step_file| require step_file }
