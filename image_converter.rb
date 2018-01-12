require 'imgkit'

class ImageConverter

  def initialize (website = "", quality = "", format = "")
    @website = website
    @quality = "#{quality.to_i}0".to_i
    @format = format
  end

  def call

    unless good_params?
      p "Usage format: $ ruby html_to_image.rb http://www.google.com 7 jpg"
      p "Where 7 is the quality. Ranges from 1 to 10"
      p "And jpg is the format. Available formats : [jpg, jpeg, png]"
      return false
    end

    unless valid_quality_param?
      p "quality value error"
      p "Enter a number between 1 and 10"
      return false
    end 

    kit = IMGKit.new(@website, quality: @quality)

    timestamp = Time.now.strftime("%d-%m-%Y-%H-%M")

    if @format == "jpeg"
      kit.to_file("#{timestamp}-image.jpeg")
      p "File downloaded ---  #{timestamp}-image.jpeg"
      return true
    elsif @format == "jpg"
      kit.to_file("#{timestamp}-image.jpg")
      p "File downloaded ---  #{timestamp}-image.jpg"
      return true
    elsif @format == "png"
      kit.to_file("#{timestamp}-image.png")
      p "File downloaded ---  #{timestamp}-image.png"
      return true
    else
      p "Unknown file format !!!"
      p "Use jpg, jpeg or png format"
      return false
    end
  end

  private

  def good_params?
    return false if @website == "" || @quality == "" || @format == ""
    return true
  end

  def valid_quality_param?
    return false if @quality < 1 || @quality > 100
    return true
  end
  
end