require 'tkextlib/tkimg/png'

class Canvas < TkCanvas
  def initialize(root, columns, rows, name)
    super root
    width columns
    height rows
    TkcImage.new self, columns / 2, rows / 2 do
      image TkPhotoImage.new :file => name
    end
    pack
  end
end
