require './cacher.rb'

class Cacher::Cache
  def write_in_file(filename)
    return raise if self.cch == {}
    mar_str = Marshal.dump([self.size, self.cch])
    File.open(filename, "w"){ |file| file.write(mar_str) }
    #should it be empty?
    rescue
    puts "The cache is empty"
  end

  def load_from_file(filename)
    return raise unless File.exist?(filename)
    strng = File.open(filename){ |file| file.read }
    arr_with_cache_construction = Marshal.load(strng)
    self.size = arr_with_cache_construction[0]
    self.cch = arr_with_cache_construction[1]
    rescue
    puts "The cache is empty"
  end
end
