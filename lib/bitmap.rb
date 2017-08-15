class Bitmap
  DEFAULT_COLOR = "0"

  attr_reader :image

  def initialize(x:, y:)
    @x, @y = x, y
    clear
  end

  def show
    puts @image.map { |line| line << "\n" }.join
  end

  def clear
    @image = Array.new(@y) { Array.new(@x, DEFAULT_COLOR) }
  end

  def draw_colour(x:, y:, colour:)
    x, y = normalize_coordinates(x: x, y: y).values_at(:x, :y)
    image[x][y] = colour
  end

  private
  def normalize_coordinates(x:, y:)
    raise 'no' unless @x >= x or @y >= y
    { x: x - 1, y: y - 1 }
  end
end
