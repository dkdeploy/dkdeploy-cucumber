
# Loads ruby files from directory `supports'.
Dir.glob(File.expand_path('../support/*.rb', __FILE__)).each { |support_file| require support_file }
