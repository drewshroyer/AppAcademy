# PHASE 2
def convert_to_int(str)
  begin
    num = Integer(str)
  rescue ArgumentError
    puts "I'm sorry, that cannot be converted to an Integer. Please pass a valid number"
  ensure
    num ||= 0
  end

  num
end

# PHASE 3

FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit) 
  if FRUITS.include? maybe_fruit 
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError 
  else 
    raise FruitError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin 
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError => coffee_e
    puts coffee_e.message
    retry
  rescue FruitError => fruit_e
    puts fruit_e.message
  end
end  

class CoffeeError < StandardError
  def message 
    puts "too much coffee! i can't take it - try again :)"
  end
end

class FruitError < StandardError
  def message 
    puts "not a fruit!"
  end
end

# def try_again
#   puts "I need some coffee to get through this!"

#   puts "
#   maybe_coffee = gets.chomp
#   reaction(maybe_coffee) 
# end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)

    @name = name
    # begin 
    #   yrs_known >= 5
    # rescue AgeError => young
    #   young.message
    # ensure 
    #   yrs_known >= 5
    # end
    # @yrs_known = yrs_known

    raise ArgumentError.new("be friends longer - length too short") if yrs_known < 5
    @name = name
    raise ArgumentError.new("no new friends") if name.empty?
    @name = name
    raise ArgumentError.new("you must have something in common") if fav_pastime.empty?
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

class AgeError < StandardError
  def message 
    puts "friendship is like a fine wine. it needs to age - come back in a few years"
  end
end


