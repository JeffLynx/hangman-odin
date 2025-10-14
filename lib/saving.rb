require 'yaml'

class Saving
  SAVE_FILE = File.expand_path('../data/save.yml', __dir__)

  def self.save(game)
    File.open(SAVE_FILE, 'w') do |file|
      file.write(YAML.dump(game))
    end
    puts "\nGame saved!"
  end

  def self.load
    if File.exist?(SAVE_FILE)
      YAML.safe_load(
        File.read(SAVE_FILE),
        permitted_classes: [Game, Symbol],
        aliases: true
      )
    else
      puts 'No saved game found.'
      nil
    end
  end
end
