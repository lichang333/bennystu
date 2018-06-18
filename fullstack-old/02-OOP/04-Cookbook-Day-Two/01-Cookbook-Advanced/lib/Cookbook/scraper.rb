 require 'nikkou'

 class Scraper
  require 'nokogiri'
  require 'open-uri'
  require 'json'
  require 'pry'
  require 'active_support/core_ext/hash'


  def initialize(search_term)
    html_data = open("http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{ search_term }").read
    @loaded_page = Nokogiri::HTML(html_data)
    # binding.pry

  end

  def find_name
    recipe_names = @loaded_page.xpath("//div[@class='m_titre_resultat']/a")
    @name_array = []
    recipe_names.each do |recipe_element|
      name_array << recipe_element.text
    end
    @name_array
  end

  def find_info
    @recipe_properties_array = []
    info = @loaded_page.xpath("//div[@class='m_detail_recette']")
    keys = [:recipe_type, :difficulty, :cost, :vegetarian]
    info.each do |item|
      recipe_array = item.text.strip.split(" - ")
      recipe_array.delete_at(0)
      recipe_properties = Hash[keys.zip(recipe_array)]
      @recipe_properties_array << recipe_properties
    end
    @recipe_properties_array
  end

  def find_prep_time
    prep_times = @loaded_page.xpath("//div[@class='m_detail_time']/div[@style='float:left;'][1]")
    prep_times.each_with_index do |times, i|
      @recipe_properties_array[i][:prep_time] = times.text[1..-1]
    end
    @recipe_properties_array
  end

  def find_description

    description_link = @loaded_page.css('.m_item')
    description_link.search('a').each_with_index do |link, i|
      html_data = open("http://www.letscookfrench.com#{ link["href"]}").read
      recipe_page = Nokogiri::HTML(html_data)
      ingredients = recipe_page.xpath('//div[@data-type="gr"]').text.split("- ")
      @recipe_properties_array[i][:ingredients] = ingredients[1..-1]
      instructions = recipe_page.xpath('//div[@class="m_content_recette_todo"]').text.gsub(/(\\r\\n)/,"")
      p instructions
      @recipe_properties_array[i][:method] = instructions
    end
   #  d_link = description_link.map {|element| element["href"]}.compact
   # p d_link
    # prep_times.each_with_index do |link, i|

    #   @recipe_properties_array[i][:description] = times.text[1..-1]
    # end
    # @recipe_properties_array
  end
end


# find_info(loaded_page)
# find_prep_time(loaded_page)
# @recipe_name = find_name
# @recipe_hash = Hash[recipe_name.zip(@recipe_properties_array)]
# p @recipe_hash

scraper = Scraper.new("strawberry")
scraper.find_info
scraper.find_prep_time
scraper.find_description
