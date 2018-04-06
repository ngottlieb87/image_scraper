class ImageController < ApplicationController
  def getImages
    require 'openssl'
    require 'open-uri'

    doc = Nokogiri::HTML(open('https://www.zoetis.com/products-services/companion-animals/dogs.aspx', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))
    @images = []
    images = doc.css('img')

    images.each do |image|
      x = image.select { |k,v| ["name", "src"].include?(k) }
      if (x[0][1].include? "dog")
        @images.push(image.values[2])
      else
        @images.push('No Dog!!!')
      end
    end

    render template: 'image/home'
  end
end
