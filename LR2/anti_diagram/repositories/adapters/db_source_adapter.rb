require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\repositories\data_sources\db_university.rb'
require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\models\student_short.rb'
require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\models\student.rb'
require_relative 'C:\Users\kirya\RubymineProjects\RubyLabs\LR2\anti_diagram\models\student_base.rb'
require 'sqlite3'
class DBSourceAdapter

  def initialize
    self.client = DBUniversity.instance
  end

  def get_by_id(student_id)
    hash = client.prepare_exec('SELECT * FROM student WHERE id = ?',student_id).first
    print(hash)
    return nil if hash.nil?

    Student.from_hash(hash)

  end

  def get_k_n_student_short_list(k,n,existing_list = nil)

    students = client.prepare_exec('SELECT * FROM student LIMIT ? OFFSET ?',n,(k-1)*n)
    slice = students.map { |h| StudentShort.from_student(Student.from_hash(h)) }
    return DataListStudentShort.new(slice) if existing_list.nil?
    existing_list.replace_objects(slice)
    existing_list
  end

  def add_student(student)
    stmt = client.prepare_exec('insert into student (first_name, last_name, dadname, telephone, telegram, mail, git) VALUES (?, ?, ?, ?, ?, ?, ?)',*student_fields(student))
    # stmt.execute(*student_fields(student))
    self.client.query('SELECT seq from sqlite_sequence where name = "student"').first.first[1]
  end

  def remove_student(student_id)
    client.prepare_exec('DELETE FROM student WHERE id = ?', student_id)
  end

  def replace_student(student_id, student)
    # stmt = client.prepare('UPDATE student SET first_name=?, last_name=?, dadname=?, telephone=?, telegram=?, mail=?, git=? WHERE id=?')
    # stmt.execute(*student_fields(student), student_id)

    template = 'UPDATE student SET first_name=?, last_name=?, dadname=?, telephone=?, telegram=?, mail=?, git=? WHERE id=?'
    client.prepare_exec(template, *student_fields(student), student_id)

  end

  def get_student_short_count
    client.query('SELECT COUNT(id) FROM student').next[0]
  end


  private

  attr_accessor :client

  def student_fields(student)
    [student.first_name, student.last_name,  student.dadname, student.telephone, student.telegram, student.mail, student.git]
  end
end