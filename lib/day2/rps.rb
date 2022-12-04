
# takes in, transcribes, and calculates the score of a rock paper scissors tournament for player 2.      Pulls data from adventofcode/rps.txt file


class RockPaperScissors
   attr_accessor :rounds, :planned_moves

   def initialize
      @planned_moves = [] # ['Rock', 'Paper', 8] last element = round_score
      @planned_outcomes = [] # same as @planned_moves
      intake_input
   end  


   def intake_input
      File.foreach("rps.txt") do |line|
         part1_translated = part1_transcribe([line[0], line[2]])
         @planned_moves << part1_translated.push(round_score(part1_translated))

         part2_translated = part2_transcribe([line[0], line[2]])
         @planned_outcomes << part2_translated.push(round_score(part2_translated))
      end
   end


   def total_score
      score = 0
      @planned_moves.each do |round|
         score += round[2]
      end
      puts "\r\n- Score calculated by planned moves: #{score}"
   end


   def corrected_total_score
      score = 0 
      @planned_outcomes.each do |round|
         score += round[2]
      end
      puts "- Score calculated by planned outcomes: #{score}"
   end


   private

   # return an array which translates the values they represent
   def part1_transcribe(input)
      rps = ['Rock', 'Paper', 'Scissors']
      p1o = ['A', 'B', 'C'] # player 1 options
      p2o = ['X', 'Y', 'Z'] # player 2 options

      return [rps[p1o.index(input[0])], rps[p2o.index(input[1])]]
   end

   # return an array which outputs required value to acheive outcome
   def part2_transcribe(input)
      rps = ['Rock', 'Paper', 'Scissors']
      p1o = ['A', 'B', 'C'] # player 1 options
      input[0] = rps[p1o.index(input[0])]
      
      case input[1]
      when 'X'   # lose
         if input[0] == rps[0]
            input[1] = rps[2]      
         elsif input[0] == rps[1]
            input[1] = rps[0]
         else
            input[1] = rps[1]
         end

      when 'Y'   # Draw
         input[0]
         input[1] = input[0] 

      when 'Z'   # Win
         if input[0] == rps[0] 
            input[1] = rps[1]      
         elsif input[0] == rps[1] 
            input[1] = rps[2]
         else
            input[1] = rps[0]
         end
      end

      return input
   end

   # return the sum of points earned by player 2 this round 
   def round_score(input)
      rps = ['Rock', 'Paper', 'Scissors']
      shape_points = rps.index(input[1]) + 1
      round_points = 0

      case input[1]
      when rps[0]    # Rock
         if input[0] == rps[2]
            round_points = 6
         elsif input[0] == rps[0]
            round_points = 3
         end

      when rps[1]    # Paper
         if input[0] == rps[0]
            round_points = 6
         elsif input[0] == rps[1]
            round_points = 3
         end

      when rps[2]    # Scissors
         if input[0] == rps[1]
            round_points = 6
         elsif input[0] == rps[2]
            round_points = 3
         end
      end

      return shape_points + round_points
   end
end