# frozen_string_literal: true

# Loads ruby files from directory `supports'.
Dir.glob(File.expand_path('support/*.rb', __dir__)).each { |support_file| require support_file }
