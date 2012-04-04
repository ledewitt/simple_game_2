module SimpleGame
  class Location # Set up what I need for a location
    attr_reader :name, :description, :objects, :exits, :exit_descriptions
  
    def initialize(name, description, objects, exits)
      @name              = name
      @description       = description
      @objects           = objects.split(/,\s*/)
      @exit_descriptions = exits.split(/,\s*/)
      @exits             = { }
    end

    def link_exits(locations)
      @exit_descriptions.each do |exit_description|
        direction         = exit_description[/\A[A-Z]+/]
        location_name     = exit_description[/[A-Z ]+\Z/].strip
        @exits[direction] = locations.find { |l| l.name == location_name }
      end
    end
    
    def full_description
      puts @description
      @objects.each { |x| puts "There is a #{x} here."}  # <--------- Shouldn't be run if there are no objects
      @exit_descriptions.each { |x| puts "From here there is a #{x}."}
      # p @location.objects.class
    end
    
    def object
      
    end
    
    def exit
      
    end
    
  end
end