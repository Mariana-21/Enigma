class Shift
  attr_reader :date, :key
  def initialize(date = Time.now.strftime("%d%m%y"), key = rand(0..99999).to_s.rjust(5, '0'))
    @date = date
    @key = key 
  end
end
