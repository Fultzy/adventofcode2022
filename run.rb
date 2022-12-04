
require_relative "./lib/day1/calories.rb"

require_relative "./lib/splash.rb"
exit = false
until exit == true do 

    sleep 0.25
    puts "\r\n - Please select one of the DAYS listed below:"
    puts " 1: Calorie Counting         2: Rock Paper Scissors"
    puts " 3: Rucksack Reorganization  4: Camp Cleanup"
    puts "\r\nOr type exit\r\n"
    print '$:> '

    responce = gets.chomp
    exit = responce.downcase == 'exit' ? true : false

    case responce.to_i
    when 1   
        mode = Calories.new
        mode.top_three

    when 2
        puts "\r\n under construction!"

    when 3
        puts "\r\n under construction!"
        
    when 4
        puts "\r\n under construction!"
    end
end