require 'imgkit'

website = ARGV[0]
quality = "#{ARGV[1].to_i}0".to_i
format = ARGV[2]

if ARGV[0].nil? || ARGV[1].nil? || ARGV[2].nil?
    p "Usage format: $ ruby html_to_image.rb http://www.google.com 7 jpg"
    p "Where 7 is the quality. Ranges from 1 to 10"
    p "And jpg is the format. Available formats : [jpg, jpeg, png]"
    exit
end

if quality < 1 || quality > 100
    p "quality value error"
    exit
end 

kit = IMGKit.new(website, :quality => quality)

timestamp = Time.now.strftime("%d-%m-%Y-%H-%M")

if format == "jpeg"
    kit.to_file("#{timestamp}-image.jpeg")
    p "File downloaded ---  #{timestamp}-image.jpeg"
elsif format == "jpg"
    kit.to_file("#{timestamp}-image.jpg")
    p "File downloaded ---  #{timestamp}-image.jpg"
elsif format == "png"
    kit.to_file("#{timestamp}-image.png")
    p "File downloaded ---  #{timestamp}-image.png"
else
    p "Unknown file format !!!"
end