class FileHandler
  def initialize(filename)
    @filename = filename
  end

  def code
    File.new(@filename, 'r').read
  end
end
