require 'tk'
require 'tempfile'
require 'rubygems'
require 'RMagick'

class Image < Magick::ImageList
  attr_reader :geometry, :name

  def initialize(filename)
    super filename

    width  = Tk.root.winfo_screenwidth
    height = Tk.root.winfo_screenheight - 50

    resize_to_fit! width,   rows   if columns > width
    resize_to_fit! columns, height if rows    > height

    left    = (width  / 2 - columns  / 2).to_s
    top     = (height / 2 - rows     / 2).to_s
    @geometry = columns.to_s + 'x' + rows.to_s + '+' + left + '+' + top
    @name = (Tempfile.open ['png32:resize', '.png']).path

    write @name
  end
end
