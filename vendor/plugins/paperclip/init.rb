require File.join(File.dirname(__FILE__), "lib", "paperclip")


if RAILS_ENV == "production"
  Paperclip.options[:image_magick_path] = "/usr/bin"
end
