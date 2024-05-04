class CinemaRoom
  attr_reader :name, :rows, :seats_per_row, :seats

  def initialize(name, rows, seats_per_row)
    @name = name
    @rows = rows
    @seats_per_row = seats_per_row
    @seats = Array.new(rows) { Array.new(seats_per_row, nil) }
  end

  def show_seats
    puts "Available seats in #{@name} room:"
    puts "="*50
    puts '======================SCREEN======================'
    puts "="*50
    puts "\n"
    @seats.each_with_index do |row, index|
      row.each_with_index do |seat, subindex|
        # print seat ? "X " : "#{index + 1}-#{subindex + 1} "
        print "\t #{seat ? 'X ' : 'L '}"
      end
      row_label = (index + 65).chr
      puts "\t Row #{row_label}"
    end
  end

  private

  def valid_seat?(row, seat_number)
    row.between?(0, @rows - 1) && seat_number.between?(0, @seats_per_row - 1)
  end
end
