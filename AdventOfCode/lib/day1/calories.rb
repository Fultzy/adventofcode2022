# pulls each number from calories.txt and puts them into an array until a line with no number is found at which point the array is closed, summed up, and sent to a queryable hash.    
#   Pulls data from adventofcode/calories.txt 


class Calories
    attr_accessor :elves_summed

    def initialize
        @elves_summed = sum_elves
    end

    def sum_elves
        eNum = 0
        buff = []
        sumed = {}

        File.foreach("calories.txt") do |line|
            if line.strip! == '' 
                eNum += 1
                sumed["elf #{eNum}"] = buff.sum
                buff.clear
            else
                buff << line.to_i
            end
        end
        sumed
    end


    def highest_calories
        most_calories = @elves_summed.max_by{ |k,v| v }
        puts "\r\n - Most calories -\r\n#{most_calories[0].capitalize} has #{most_calories[1]} calories"
    end

    def top_three
        temp_elves = @elves_summed
        num1 = temp_elves.max_by{ |k,v| v }
        temp_elves.delete(num1[0])
        num2 = temp_elves.max_by{ |k,v| v }
        temp_elves.delete(num2[0])
        num3 = temp_elves.max_by{ |k,v| v }
        temp_elves.delete(num3[0])

        puts "\r\n - Top Three Most Calories -"
        puts "1: #{num1[0].capitalize} has #{num1[1]} calories"
        puts "2: #{num2[0].capitalize} has #{num2[1]} calories"
        puts "3: #{num3[0].capitalize} has #{num3[1]} calories"
        
        puts "Total Calories = #{num1[1] + num2[1] + num3[1]}"
    end
end



