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
        if vip_room.reservations? || imax_room.reservations? || twod_room.reservations?
          puts "Thank you for using our reservation system, enjoy your movie!"
        else
          puts "Thank you for using our reservation system, see you soon!"
        end
        exit
      else
        puts "Invalid option, please choose a valid option!"
      end
    end
  end

  def show_main_menu
    puts "\n\n"
    puts "===================================== Welcome to CinemaBistro! ====================================="
    puts "="*100
    puts "1. Show Rooms"
    puts "4. Exit"
    print "Please, choose an option: "
  end
end
