#!/usr/bin/env ruby

#  Name    ::  Dossier
#  Author  ::  Mike Zazaian
#  Updated ::  2010-01-16
#  Detail  ::  A Resume Builder for Rubyists

module Dossier
  
  # Load all sub-directories recursively as load paths
  Dir.glob("**/").each {|d| $LOAD_PATH << d }
  
  # Require external libraries
  require 'rubygems'
  require 'logger'
  require 'choice'
  
  # Require application files
  require 'version'
  require 'rubyist'

  # Create a logger to use application-wide 
  $logger = Logger.new STDOUT
  
end
