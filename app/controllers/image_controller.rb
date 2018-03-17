class ImageController < ApplicationController
  def getImages
    require 'openssl'
    require 'open-uri'
    
    doc = Nokogiri::HTML(open('http://www.snowtours.com', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    @images = []
    images = doc.css('img')

    images.each do |image|
      @images.push(image.values[0])
    end

    render template: 'image/home'
  end
end
