class Dossier::Rubyist
  attr_accessor :name, :email, :website, :phone, 
                :objective, :skills, :languages, :applications, :databases, :gems,
                :work_experience, :academic_history
  def initialize(options={})
    # Set defaults for basic contact info 
    opts = {}.merge options
    
    # Set instance variables for valid options
    Dossier.aggregate_options opts 
  
    # Set work_experience and academic_history to empty arrays
    @work_experience = @academic_history = []
  end
 
  protected
    # Iterate through the initialization options and set instance variables for
    # all of the ones that exist, print a warning for the ones that don't
    def self.aggregate_options(options)
      options.each do |key, value|
        self.send("#{key.to_s}=", value) and next if self.respond_to?(key)
        $logger.warn ":#{key.to_s} is not a valid option."
      end
    end
end
