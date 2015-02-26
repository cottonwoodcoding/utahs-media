require "#{Rails.root}/lib/services/image_shack.rb"

class GalleryController < ApplicationController
  include ImageShack

  def index
    @album_hash = {}
    image_shack_images.each do |image|
      image_hash = {}
      direct_link = image['direct_link']
      image_hash[:src] = direct_link
      image_hash[:description] = image['description']
      image_hash[:thumb] = thumbnail(direct_link)
      album = image['album']
      if @album_hash.has_key?(album['id'])
        @album_hash[album['id']][:images] << image_hash
      else
        @album_hash[album['id']] = { name: album['title'], images: [] }
        @album_hash[album['id']][:images] << image_hash
      end
    end
  end
end
