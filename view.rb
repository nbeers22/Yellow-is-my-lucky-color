require_relative 'flashcards.rb'
require_relative 'controller.rb'

class View

  def self.prompt
    puts "Welcome to Sort Out Your Confusion Flashcards!"
    puts "Are you ready to rumble? (Y/N)"
    user_input = gets.chomp.upcase
    if user_input == "Y"
      # call method
    else
      View.exit
    end
  end

  def self.correct 
    puts "You are super smart! You get one point!"
  end

  def self.incorrect 
    puts "Someone hasn't been studying! That's the wrong answer. Try again!"
  end

  def self.exit 
    puts "Thanks for playing!" 
    puts "You got " + Controller.correct_count + " answers right and " + Controller.incorrect_count + " wrong."


  puts "                              ,----------.                              "
  puts "                            (Meo- YELLOW! )                  .-.        "
  puts "                             `-----------'                    \\ \\       "
  puts "                                   (_)                         \\ \\      "
  puts "                                       O                       | |      "
  puts "                  |\\ /\\                  o                     | |      "
  puts "  __              |,\\(_\\_                  . /\\---/\\   _,---._ | |      "
  puts " ( (              |\\,`   `-^.               /^   ^  \\,'       `. ;      "
  puts "  \\ \\             :    `-'   )             ( @   @   )           ;      "
  puts "   \\ \\             \\        ;               `.=o=__,'            \\      "
  puts "    \\ \\             `-.   ,'                  /         _,--.__   \\     "
  puts "     \\ \\ ____________,'  (                   /  _ )   ,'   `-. `-. \\    "
  puts "      ; '                ;                  / ,' /  ,'        \\ \\ \\ \\   "
  puts "      \\                 /___,-.            / /  / ,'          (,_)(,_)  "
  puts "       `,    ,_____|  ;'_____,'           (,;  (,,)      Walker         "
  puts "     ,-  \\  :      | :                                                  "
  puts "    ( .-  \\ `.__   | |                                                  "
  puts "     \\__)  `.__,'  |__)  Texas Ranger                                   "
  

  end
  
end

