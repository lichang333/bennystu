 class Recipe
  require 'nokogiri'
  require 'open-uri'
  require 'pry'


  puts "what would you like to search"
  @search_term = gets.chomp

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

  def find_info(loaded_page)
    info = @loaded_page.xpath("//div[@class='m_detail_recette']")
    keys = [:recipe_type, :difficulty, :cost, :vegetarian]
    @recipe_properties_array = []
    info.each do |item|
      recipe_array = item.text.strip.split(" - ")
      recipe_array.delete_at(0)
      recipe_properties = Hash[keys.zip(recipe_array)]
      @recipe_properties_array << recipe_properties
    end
    @recipe_properties_array
  end

  def find_prep_time(loaded_page)
    prep_times = @loaded_page.xpath("//div[@class='m_detail_time']/div[@style='float:left;'][1]")
    prep_times.each_with_index do |times, i|
      @recipe_properties_array[i][:prep_time] = times.text[1..-1]
    end
    @recipe_properties_array
  end



find_info(loaded_page)
find_prep_time(loaded_page)
@recipe_name = find_name
@recipe_hash = Hash[recipe_name.zip(@recipe_properties_array)]
p @recipe_hash



# class RecipeScraper
#   def
# end
