# rubocop:disable Metrics/MethodLength
require './person'
require './student'
require './teacher'
require './book'
require './rental'
# Decare a variables to hold lists
@books = []
@persons = []
@rentals = []
# class_room = Classroom.new("CR1001")
# list all books
def list_books
  if @books.empty?
    puts 'The books list is empty!'
  else
    @books.each_with_index do |book, index|
      puts "#{index} Title: #{book.title}, Author: #{book.author}"
    end
  end
end

# list all people
def list_persons
  if @persons.empty?
    puts "People's list is empty!"
  else
    @persons.each_with_index do |person, index|
      puts "#{index} Name: #{person.name}, Id: #{person.id}, Age: #{person.age}"
    end
  end
end

# Create a person (teacher or student, not a plain Person).
def create_person
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'

  input = gets.chop.to_i

  if [1, 2].include?(input)
    print 'age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    case input
    when 1
      print 'Classroom: '
      classroom = gets.chomp
      print 'Has parent permission [Y/N]: '
      parent_permission = gets.chomp
      parent_permission = parent_permission.upcase! == 'Y'
      student = Student.new(age: age, classroom: classroom, name: name, parent_permission: parent_permission)
      @persons.push(student)
      puts 'Person created  successfully'
    when 2
      print 'Specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(age: age, specialization: specialization, name: name)
      @persons.push(teacher)
      puts 'Person created  successfully'
    end
  else
    puts 'Invalid Person'
  end
end

# Create a book.
def create_book
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  new_book = Book.new(title, author)
  @books << new_book
  puts 'Book created successfuly'
end

# Create a rental.
def create_rental
  puts 'Select a book from the following list by number'

  list_books
  book_id = gets.chomp
  book = nil
  book = @books[book_id.to_i] if book_id.to_i.to_s == book_id && book_id.to_i < @books.length
  puts 'Select a person from the following list by number (not id)'

  list_persons
  person = nil
  person_id = gets.chomp
  person = @persons[person_id.to_i] if person_id.to_i.to_s == person_id && person_id.to_i < @persons.length
  if book && person
    print 'Date: '
    date = gets.chomp
    new_rental = Rental.new(date, book, person)
    @rentals.push(new_rental)
    puts 'Rental created successfuly'
  else
    puts 'Invalid person or book ID'
  end
end

# List all rentals for a given person id.
def list_all_rentals
  print 'ID of person: '
  id = gets.chomp
  person = @persons.filter { |val| val.id == id.to_i }
  if person.length.positive?
    person = person[0]
    @rentals.each do |rent|
      puts "Date: #{rent.date}, Book: #{rent.book.title} by #{rent.book.author}" unless rent.person.id != person.id
    end
  else
    puts 'No person found with that ID'
  end
  ''
end
# rubocop:enable Metrics/MethodLength
