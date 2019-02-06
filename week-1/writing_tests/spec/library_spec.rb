require "library"

describe Library do
  it 'can return a list of all books' do
    #Arrange
    library = Library.new
    #Act
    #Assert
    expect(library.list_books).eql?([
       {title: 'POODR', author: 'Sandi Metz', subject: 'OOP'},
       {title: 'Learn Ruby The Hard Way', author: 'Zed Shaw', subject: 'Ruby'},
       {title: 'Eloquent JavaScript', author: 'Marijn Haverbeke', subject: 'JS'},
       {title: 'The Well Grounded Rubyist', author: 'Sandi Metz', subject: 'Ruby'},
    ])
  end

  it 'can add a new book' do
    library = Library.new

    #act
    library.add_book({title: 'Harry Potter', author: 'J.K.', subject: 'Magic'})

    #Assert
    expect(library.books).to include({title: 'Harry Potter', author: 'J.K.', subject: 'Magic'})
  end

  it 'can find a specific book' do
    library = Library.new

    #act
    expect(library.find_book('POODR')).to include({title: 'POODR', author: 'Sandi Metz', subject: 'OOP'})
    #Assert

  end

  it 'can delete a book' do
    library = Library.new

    #ACT
    library.remove_book('POODR')
    #Assert
    expect(library.list_books).not_to include({title: 'POODR', author: 'Sandi Metz', subject: 'OOP'})
  end

  it 'can return a list of all books by subject' do
    library = Library.new

    #ACT
    puts (library.all_books_by_subject('Ruby'))
    #Assert
    expect(library.all_books_by_subject('Ruby')).to include({:title=>"Learn Ruby The Hard Way", :author=>"Zed Shaw", :subject=>"Ruby"},
{:title=>"The Well Grounded Rubyist", :author=>"Sandi Metz", :subject=>"Ruby"})
  end
end
