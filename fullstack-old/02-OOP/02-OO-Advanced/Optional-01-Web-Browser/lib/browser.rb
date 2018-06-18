require "open-uri"
require "nokogiri"


class Browser
  # def initialize
  #   @url = ""
  #   # fetch_content(url)
  # end

  def fetch_content(url)
    Nokogiri::HTML(Kernel.open(url)).content
  end
end

