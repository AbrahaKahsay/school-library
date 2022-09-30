
# Decare a variables to hold lists
@books = []
@persons = []
@rentals = []
@classroom = Classroom.new("CR 1001")

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

# Create a person
def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    
    input = gets.chop.to_i
    if [1, 2].include?(input)
        print 'Name: '
        name = gets.chomp
        print 'age: '
        age = gets.chomp.to_i
        case input
        when 1
            print 'Has parent permission [Y/N]: '
            permission = gets.chomp
            permission.upcase == 'Y'
            student = Student.new(age, classroom, name, permission)
            @persons.push(student)
            puts 'Person created  successfully'
        when 2
            print 'Specialization: '
            specialization = gets.chomp
            teacher = Teacher.new(age, specialization, name)
            @persons.push(teacher)
            puts 'Person created  successfully'
        end
    else
        puts 'Invalid Person'
    end
end

def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts 'Book created successfuly'
end

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