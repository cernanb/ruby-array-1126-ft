require 'pry'

def start
    books = [{title: "Harry Potter", author: "JK", price: 1499}]
    create_books(books)
    input = nil

    while input != 'exit'
        puts "What would you like to do?"
        puts "(a) add a book | (s) sort | (p) print | (d) delete | (c) count | (se) filter | (c) clear array" 

        input = gets.chomp
        
        if input == 'a'
            puts "How many books would you like to add?"

            adder = gets.chomp.to_i

            adder.times do
                puts "what book would you like to add?"
                book = gets.chomp
    
                books << book
                puts "#{book} was added to the list!!!"
            end


        elsif input == 'c'
            books.clear
        elsif input == 'se'
            puts "Input a keyword and we will return all titles with that keyword"

            search = gets.chomp

            filtered = books.collect do |book_title|
                if book_title.downcase.include?(search.downcase)
                    book_title
                end
            end.compact
            

            puts "Here are all the books that have the word #{search} in the title."
            print_books(filtered)

        elsif
            input == 'c'
            puts "There are #{book_count(books)} books in the array."
            # There are 2 books in the array
        elsif input == 'd'
            puts "What book would you like to delete?"
            book = gets.chomp

            if books.include?(book)
                books.delete(book)
            else
                puts "that book is not in the array"
            end
        elsif input == 's'
            sorted_books = books.sort
            print_books(sorted_books)
        elsif input == 'p' 
            # binding.pry
            print_books(books)
        end
        
    end
end

def book_count(books)
    books.count
end

def print_books(books)
    books.each.with_index(1) do |book, index|
        puts "#{index}. #{book}"
    end
end

start