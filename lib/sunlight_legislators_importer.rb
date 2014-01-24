require 'csv'
require 'pry'
require '../app/models/senator.rb'
class SunlightLegislatorsImporter
  def self.import(filename)

    senfields = [
      :firstname,
      :lastname,
      :title,
      :phone,
      :fax,
      :website,
      :email,
      :party,
      :gender,
     :birthdate,
    :twitter_id]
    csv = CSV.new(File.open(filename), :headers => true)
    csv.each do |row|
      sen = {}
      row.each do |field, value|
        sym = field.to_sym
        if senfields.include?(sym)
          sen[sym] = value
        end
      end
      Senator.create!(sen)
    end
  end
end

SunlightLegislatorsImporter.import("../db/data/legislators.csv")

# IF YOU WANT TO HAVE THIS FILE RUN ON ITS OWN AND NOT BE IN THE RAKEFILE, UNCOMMENT THE BELOW
# AND RUN THIS FILE FROM THE COMMAND LINE WITH THE PROPER ARGUMENT.
# begin
#   raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
#   SunlightLegislatorsImporter.import(ARGV[0])
# rescue ArgumentError => e
#   $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <filename>"
# rescue NotImplementedError => e
#   $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
# end
