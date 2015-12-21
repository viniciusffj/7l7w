number=rand(10)

begin 
  puts "Try to guess"
  entered=gets.to_i

  difference = number - entered
  if difference > 0
    puts 'Too low' if difference > 5
    puts 'low'     if difference <= 5
  elsif difference < 0
    puts 'Too high'  if difference < -5
    puts 'high'      if difference >= -5
  end
end while entered != number 

puts "Alright!"

# better loop
# better comparation with numbers
