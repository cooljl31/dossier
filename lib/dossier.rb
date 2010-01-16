#!/usr/bin/env ruby

#:: Name    :  Dossier
#:: Author  :  Mike Zazaian
#:: Updated :  2010-01-16
#:: Detail  :  A Resume Builder for Rubyists

# Load all sub-directories recursively as load paths
Dir.glob("**/").each {|d| $LOAD_PATH << d}

# Create a logger to use application-wide 
require 'logger'
$logger = Logger.new STDOUT

module Dossier
  # Require external libraries
  require 'rubygems'
  require 'choice'
  
  # Require application files
  require 'version'

  class Rubyist
    attr_accessor :name, :email, :website, :phone, 
                  :objective, :skills, :languages, :applications, :databases, :gems,
                  :work_experience, :academic_history
    def initialize(options={})
      # Set defaults for basic contact info 
      opts = {}.merge options
      
      # Set instance variables for valid options
      aggregate_options opts 

      # Set work_experience and academic_history to empty arrays
      @work_experience = @academic_history = []
    end

    # Iterate through the initialization options and set instance variables for
    # all of the ones that exist, print a warning for the ones that don't
    def aggregate_options(options)
      options.each do |key, value|
        self.send("#{key.to_s}=", value) and next if self.respond_to?(key)
        $logger.warn ":#{key.to_s} is not a valid option."
      end
    end
  end
end
