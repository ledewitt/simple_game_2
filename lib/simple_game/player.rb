class Player
  def initialize(world)
    @location = world.locations.find { |l| l.name == "LIVING ROOM" }
    @inventory = ["BELLY LINT"]
  end
  
  def look
    puts @location.description
    @location.objects.each { |x| puts "There is a #{x} here."}
    @location.exit_descriptions.each { |x| puts "From here there is a #{x}."}
    # p @location.objects.class
  end
  
  def pickup(object)
    @location.objects.each do |obj_in_room|  # use find()
      if obj_in_room == object.upcase
        @inventory << object.upcase
        @location.objects.delete(obj_in_room)
      end
    end
  end
  
  def walk(direction)
    # Change Bob's location on the world object
    if location = @location.exits[direction.upcase]
      @location = location
    else
      puts "Unknown direction."
    end
    look
  end
  
  def inventory
    # Inventory still need to create the array for inventory
    puts @inventory
  end
  
  def dunk
    # Only if you have a chained bucket and are in the garden location
    puts "You can't dunk here your not MJ"
  end
  
  def weld
    # Only if you have the chain and bucket and are in the attic
    puts "Only if you have a torch"
  end
  
  def splash
    # Only if you have a full bucket and are in the living room
    puts "I wouldn't if I were you"
  end
end