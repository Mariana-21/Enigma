class Shift
  attr_reader :date, :key
  def initialize(date = Time.now.strftime("%d%m%y"), key = rand(0..99999).to_s.rjust(5, '0'))
    @date = date
    @key = key
  end

  def offset_key(date)
    square_date = date.to_i ** 2
    offset = square_date.to_s.split(//)
    offset_array = offset[5..8].map(&:to_i)
  end

  def key_pairs
     paired_keys = @key.split(//).map(&:to_i)
     numbers =
      paired_keys[0..1].join.to_i,
      paired_keys[1..2].join.to_i,
      paired_keys[2..3].join.to_i,
      paired_keys[3..4].join.to_i
  end
end
