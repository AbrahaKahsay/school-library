# rubocop:disable Metrics/CyclomaticComplexity
require './app'
def main # rubocop:disable Metrics/MethodLength
  puts "\nWELCOME TO OUR SCHOOL LIBRARY \n"
  menu = [
    "\nPlease choose an option by entering a number",
    '1 - List all books',
    '2 - List all people',
    '3 - create a person',
    '4 - create a book',
    '5 - create a rental',
    '6 - List all rental for a given person id',
    "7 - Exit \n"
  ]
  puts menu

  input = gets.chomp.to_i
  while input != 7
    case input
    when 1
      list_books
    when 2
      list_persons
    when 3
      puts create_person
    when 4
      puts create_book
    when 5
      puts create_rental
    when 6
      puts list_all_rentals
    end
    puts menu
    input = gets.chomp.to_i
  end
end

main
# rubocop:enable Metrics/CyclomaticComplexity
