require_relative 'models/cinema_room'
require_relative 'models/vip_room'
require_relative 'models/imax_room'
require_relative 'models/twod_room'

class Main
  def main
    vip_room = VIPRoom.new
    imax_room = IMAXRoom.new
    twod_room = TwoDRoom.new

    loop do
      show_main_menu
      option = gets.chomp.to_i

      case option
      when 1
        puts "Choose a type of room:"
        puts "1. VIP"
        puts "2. IMAX"
        puts "3. 2D"

        option_room = gets.chomp.to_i

        case option_room
        when 1
          vip_room.show_seats
        when 2
          imax_room.show_seats
        when 3
          twod_room.show_seats
        else
          puts "Invalid option!"
        end
      when 4
        puts "Thank you for use our reservation system, see you soon!"
        exit
      else
        puts "Invalid option, please choose a valid option!"
      end
    end
  end

  def show_main_menu
    puts "Welcome to CinemaBistro!"
    puts "="*30
    puts "1. Show available seats"
    puts "4. Exit"
    print "Please, choose an option: "
  end
end
