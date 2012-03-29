module SimpleGame
  class Location # Set up what I need for a location
    attr_accessor :name, :description, :objects, :exits  # better as reader
    attr_reader :exit_descriptions
  
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
  end
end