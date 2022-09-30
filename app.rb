
# Decare a variables to hold lists
@books = []
@persons = []
@rentals = []

# list all books
def list_books
    @books.each_with_index do |book, index|
    puts "#{index} Title: #{book.title}, Author: #{book.author}"
end

#list all people
def list_persons
    @persons.each_with_index do |person, index|
    puts "#{index} Name: #{person.name}, Id: #{person.id}, Age: #{person.age}"
end