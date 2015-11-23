module NASARover
  class CLI

    def self.start
      new.start
    end

    def start
      puts "Insert top-right plateau coordinates: "
      plateau_boundaries = gets.chomp.strip.split

      puts "Insert first rover location and direction: "
      rover_one_location = gets.chomp.strip.split

      puts "Insert first rover movement pattern: "
      rover_one_movement = gets.chomp.strip.split('')

      puts "Insert second rover location and direction: "
      rover_two_location = gets.chomp.strip.split

      puts "Insert second rover movement pattern: "
      rover_two_movement = gets.chomp.strip.split('')

      plateau_boundary = NASARover::Position.new(plateau_boundaries[0].to_i, plateau_boundaries[1].to_i)
      plateau = NASARover::Plateau.new(plateau_boundary)

      rover_one_position = NASARover::Position.new(rover_one_location[0].to_i, rover_one_location[1].to_i)
      rover_one = NASARover::Rover.new(rover_one_position, rover_one_location[2])

      rover_two_position = NASARover::Position.new(rover_two_location[0].to_i, rover_two_location[1].to_i)
      rover_two = NASARover::Rover.new(rover_two_position, rover_two_location[2])

      rover_one_navigator = NASARover::Navigator.new(rover_one, plateau)
      rover_two_navigator = NASARover::Navigator.new(rover_two, plateau)

      rover_one_movement.each do |command|
        rover_one_navigator.navigate(command)
      end

      puts rover_one_navigator.report_position

      rover_two_movement.each do |command|
        rover_two_navigator.navigate(command)
      end

      puts rover_two_navigator.report_position
    end
  end
end
