class Jukebox
  attr_reader :songs
  PROMPT = "> "

  def initialize(songs)
    @songs = songs
  end

  def welcome
    puts "\nWelcome to your..."
    puts "*~---------------------~*"
    puts "│ ♩♩ ♫ ♩ JUKEBOX ♩♩ ♫ ♩ │"
    puts "*~---------------------~*"
  end

  def get_user_input
    gets.strip.downcase
  end

  def help
    puts "\nJukebox accepts the following commands:"
    puts "---------------------------------------"
    puts "» help : displays this help message"
    puts "» list : displays a list of songs you can play"
    puts "» play : lets you choose a song to play"
    puts "» exit : exits this program"
  end

  def list
    puts "\nYou can choose from the following songs:\n\n"
    songs.each.with_index(1) { |song, index| puts "(#{index}) #{song}" }
  end

  def play(input = nil)
    if input.nil?
      puts "\nWhich song would you like to hear?"
      print PROMPT
      input = get_user_input
    end

    song = songs.find.with_index(1) do |s, i|
      input == s.downcase || input == i.to_s
    end

    puts "\nNow Playing: #{song}"
  end

  def goodbye
    puts "\nGoodbye.\n\n"
    abort
  end

  def invalid_command
    puts "\nInvalid input, please try again."
  end

  def call
    welcome
    help
    while true
      puts "\nPlease enter a command:"
      print PROMPT
      input = get_user_input
      case input
        when 'help' then help
        when 'list' then list
        when 'play' then play
        when /play\s+/ then play(input.gsub('play ', ''))
        when 'exit' then goodbye
        else help
      end
    end
  end
end
