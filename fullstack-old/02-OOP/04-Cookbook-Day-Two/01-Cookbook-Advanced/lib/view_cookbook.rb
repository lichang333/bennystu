require_relative "recipe.rb"
require_relative "cookbook.rb"

class ViewCookbook
  def initialize(cookbook)
    @cookbook = cookbook
  end

  def listing
    @cookbook.all.each_with_index do |recipe, i|
      puts "#{i+1}. #{recipe.name}"
    end
  end

  # creates a new recipe
  def ask_name
    listing
    puts "please input your recipe name"
    recipe_name = gets.chomp
  end

  def ask_description
    puts "please input your recipe description"
    recipe_description = gets.chomp
  end

  # destroys an existing recipe
  def index_delete
    listing
    puts "please type the index of the recipe you would like to delete"
    gets.chomp.to_i - 1
  end

  def search
    puts "Please search for a recipe on LetsCookFrench by entering your search terms"
    search_term = gets.chomp
    puts "Searching for #{search_term} recipes on LetsCookFrench..."
    search_term
  end

  def list_scraped_names(scraped_names)
    puts "Please type the number of the recipe you would like to import"
    scraped_names.each_with_index do |name, i|
      puts "#{i+1}. #{name}"
    end
    gets.chomp
  end
end
