require_relative "../config/environment.rb"

class Student
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

  attr_assessor :name, :grade
  attr_reader :id

  def initialize(id=nil, name, grade)
    @id = id
    @name = name
    @grade = grade
  end

  def self.create_table
    sql = <<-SQL
    SELECT TABLE IF NOT EXISTS student (
      id INTEGER PRIMARY KEY
      name TEXT
      grade INTEGER
      )
    SQL

    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
      DROP TABLE IF EXISTS students
    SQL

    DB[:conn].execute(sql)
  end

end
