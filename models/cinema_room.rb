class CinemaRoom
  attr_reader :name, :rows, :seats_per_row, :seats

  def initialize(name, rows, seats_per_row)
    @name = name
    @rows = rows
    @seats_per_row = seats_per_row
    @seats = Array.new(rows) { Array.new(seats_per_row, nil) }
    @reservations = false
  end

  def reservations?
    @reservations
  end

  def show_seats
    not_available = "\e[31m"  ## RED COLOR
    available = "\e[32m"      ## GREEN COLOR
    reset = "\e[0m"           ## RESET COLOR

    available_seats_count = 0
    reserved_seats = 0

    puts "Available seats in #{@name} room:"
    puts "="*100
    puts '============================================== SCREEN =============================================='
    puts "="*100
    puts "\n"
    @seats.each_with_index do |row, index|
      row_label = (index + 65).chr

      row.each_with_index do |seat, subindex|
        # print "\t #{row_label}-#{subindex + 1} #{seat ? 'X' : 'L'}"
        if seat == 'X'
          print "#{not_available}\t #{row_label}-#{subindex + 1} X"
          reserved_seats += 1
        else
          print "#{available}\t #{row_label}-#{subindex + 1} L"
          available_seats_count += 1
        end
      end
      
      puts "\t #{reset} Row #{row_label}"
    end
    puts "\n"

    if available_seats_count > 0
      puts "#{reset} There are #{available_seats_count} available seats in #{@name} room."
      
      if reserved_seats.zero?
        print "#{reset} Do you wanto to reserve a seat? (Y/N): "
      else
        print "#{reset} Do you wanto to reserve another seat? (Y/N): "
      end
      answer = gets.chomp.upcase

      if answer == 'Y'
        reserve_seat
        show_seats
      end
    else
      puts "#{reset} There are no available seats in #{@name} room."
    end
  end

  def reserve_seat
    end_row = ('A'.ord + @rows - 1).chr

    print "Enter the row letter (A-#{end_row}): "
    row_input = gets.chomp.upcase
    print "Enter the seat number in the row: "
    seat = gets.chomp.to_i

    row_index = row_input.ord - 65
    seat_index = seat - 1

    if valid_seat?(row_index, seat_index) && @seats[row_index][seat_index].nil?
      @seats[row_index][seat_index] = 'X'
      puts "Seat #{row_input}-#{seat} reserved successfully!"
      @reservations = true
    else
      puts "Invalid seat selection or seat already taken! Please, choose another one."
      puts "\n"
    end
  end

  private

  def valid_seat?(row, seat_number)
    row.between?(0, @rows - 1) && seat_number.between?(0, @seats_per_row - 1)
  end
end
