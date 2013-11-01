#!/usr/bin/ruby

class Box
  attr_accessor :dim, :size, :list, :all
  def initialize(num_range)
    unless num_range
      puts"Box: number range #{num_range} must not be 0"
      Process.exit
    end
    @dim = num_range
    @size = num_range * num_range
    @list = Array.new(@dim)
    for i in 1..@dim do
      @list[i] = Array.new(@dim) { 0 }
    end
    @all = Array.new(@size) { 0 }
  end
  
  def valid_location?(x, y)
    if x > 0 and x < @dim and 
       y > 0 and y < @dim
      true
    else
      false
    end
  end
  
  def is_present?(x)
    @all.include?
  end
  
  def is_location_free?(x, y)
    unless valid_location(x,y)
      puts "Box: is_location_free? - location x: #{x}, y: #{y} isn't valid"
      false
    end
    if not @list[x][y]
      true
    else
      false
    end
  end
  
  def add(number, x, y)
    if is_location_free?(x,y) and not is_present?(number)
      @list[x][y] = number
      @all[y * @dim + x] = number
      true
    else
      false
    end
  end
end
