# -*- coding: utf-8 -*-
require './image'
require './canvas'

class Window # ダサい
  def initialize(filename)
    TkRoot.new do |root|
      images = Image.new filename
      title filename
      geometry images.geometry
      resizable 0, 0
      attributes 'topmost', 1
      Canvas.new self, images.columns, images.rows, images.name
    end
  end
end

=begin
class Window < TkRoot
  def initialize(filename)
    super()
    images = Image.new filename
    title filename
    geometry images.geometry
    resizable 0, 0
    attributes 'topmost', 1
    Canvas.new self, images.columns, images.rows, images.name
  end
end
=end
