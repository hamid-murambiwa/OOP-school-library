require_relative 'rental'

class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :author
  attr_reader :students

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
