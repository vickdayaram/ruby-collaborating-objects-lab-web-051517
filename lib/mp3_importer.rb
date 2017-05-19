require 'pry'

class MP3Importer

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir["./spec/fixtures/mp3s/*"]

    #formatting code below
    normalized_files = []
      files.each do |file|
        file_m = file.split(" ")
        file_1 = file_m.shift()
        file_2 = file_1.split("/")
        file_m.unshift(file_2[-1])
        file_s = file_m.join(" ")
        normalized_files.push(file_s)
       end
      normalized_files
   end

   def import
     self.files.each do |file_name|
       Song.new_by_filename(file_name)
     end
   end
end
