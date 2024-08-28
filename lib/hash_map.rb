
class HashMap
  attr_reader :hash_map;

  def initialize
    @buckets = Array.new(16)
    @length = 0
  end
  
  LOAD_FACTOR = 0.75

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord}
    

    hash_code
  end

  def set(key,value)
    index = hash(key) % 16
    @buckets[index] = value
    @length += 1
    resize if @length >= @buckets.length * LOAD_FACTOR
  end

  def resize
   @buckets = Array.new(@buckets.length * 2)
  end

  def get(key)
    index = hash(key) % 16
    return nil if @buckets[index].nil?
    @buckets[index]
  end

  def has?(key)
    return true if get(key)
    false
  end

  def remove(key)
    index = hash(key) % 16
    @buckets[index] = nil
    @length -= 1
  end

  def length
    @buckets.length
  end

  def clear
    @buckets = Array.new(16)
    @length = 0
  end

  def keys
    keys_arr = []
    @buckets.each_with_index do |value, index|
      keys_arr.push(index) unless value.nil?
    end
    keys_arr
  end

  def values
    values_arr = []
    @buckets.each do |value|
      values_arr.push(value) unless value.nil?
    end
    values_arr
  end

  def entries
    entries_arr = []
    @buckets.each_with_index do |value, key|
      entries_arr.push([key,value]) unless value.nil?
    end
    entries_arr
  end
  
end