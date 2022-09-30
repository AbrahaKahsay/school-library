
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