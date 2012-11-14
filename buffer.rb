#TODO: find out why the tests are falling now
module Cacher

class Buffer
 attr_accessor :created_at, :last_accessed, :accesses_count, :data
  def initialize(path_to_file)
    return raise if path_to_file.class != String
    @created_at, @last_accessed  = Time.new, Time.new
    @accesses_count = 1
    @data = File.open(path_to_file){ |file| file.read_from_file }
    rescue 
    puts "There is no such filename"
  end

  def rewrite(path_to_file)
    return raise if path_to_file.class != String
    @last_accessed = Time.new
    @accesses_count += 1
    @data = File.open(path_to_file){ |file| file.read_from_file }
    rescue 
    puts "There is no such filename"
  end

  def change_access_time
    @last_accessed = Time.new
    @accesses_count += 1
  end	
end

end
