require "#{Rails.root}/lib/services/image_shack.rb"

class GalleryController < ApplicationController
  include ImageShack

  def index
    @album_hash = {}
    image_shack_albums.each do |album|
      next if album['public'] == false
      next if album['images'].length == 0
      @album_hash[album['id']] = { name: album['title'], images: [] }
      album['images'].each do |img|
        image = image_shack_image_src(img['server'], img['filename'])
        @album_hash[album['id']][:images] << image
      end
    end
  end
end
