module Dossier::Version
  MAJOR = 0
  MINOR = 0
  MICRO = 1

  def self.print
    [ MAJOR, MINOR, MICRO ].join(".")
  end
end
