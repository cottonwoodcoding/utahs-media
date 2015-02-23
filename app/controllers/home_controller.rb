require "#{Rails.root}/lib/services/image_shack.rb"

class HomeController < ApplicationController
  include ImageShack
  def index
    @images = []
    album = image_shack_albums.find {|x| x['id'] == ENV['image_shack_main_album'].to_i }
    unless album.nil?
      album['images'].each do |img|
        @images << image_shack_image_src(img['server'], img['filename'])
      end
    end
  end
end
