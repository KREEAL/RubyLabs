class DBUniversity
  private_class_method :new
  @instance_mutex = Mutex.new

  def initialize
    @client = SQLite3::Database.open 'D:/RubyMineProjects/University/university.db'
  end

  def self.instance
    return @instance if @instance

    @instance_mutex.synchronize do
      @instance ||= new
    end
    @instance
  end

end