require "#{Rails.root}/lib/services/image_shack.rb"

class HomeController < ApplicationController
  include ImageShack
  def index
    @images = []
    album = image_shack_albums.find {|x| x['id'] == ENV['image_shack_main_album'] }
    unless album.nil?
      album['images'].each do |img|
        image_hash = {}
        image_hash[:src] = img['direct_link']
        @images << image_hash
      end
    end
  end
end
