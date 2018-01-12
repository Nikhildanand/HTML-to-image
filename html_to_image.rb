require_relative 'image_converter.rb'

website = ARGV[0]
quality = ARGV[1]
format = ARGV[2]

image_converter = ImageConverter.new(website, quality, format)
convert_image = image_converter.call()

