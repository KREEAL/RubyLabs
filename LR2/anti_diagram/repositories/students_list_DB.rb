require_relative 'db_university'
class StudentsListDB

  def initialize
    self.client = DBUniversity.instance
  end

  def student_by_id(student_id)


    hash = client.prepare_exec('SELECT * FROM student WHERE id = ?',student_id).first
    print(hash)
    return nil if hash.nil?

    Student.from_hash(hash)
    #
    #
    # self.client.toggle_results_as_hash
    # hash = client.prepare_exec('SELECT * FROM student WHERE id = ?', student_id).first
    # self.client.toggle_results_as_hash
    # return nil if hash.nil?
    #
    # Student.from_hash(hash)


  end

  def get_k_n_student_short_list(k,n)

    students = client.prepare_exec('SELECT * FROM student LIMIT ? OFFSET ?',(k-1)*n,n)
    slice = students.map { |h| StudentShort.from_student(Student.from_hash(h)) }

    DataListStudentShort.new(slice)
  end

  def add_student(student)
    stmt = client.prepare('insert into student (first_name, last_name, dadname, telephone, telegram, mail, git) VALUES (?, ?, ?, ?, ?, ?, ?)')
    stmt.execute(*student_fields(student))
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

  def student_count
    client.query('SELECT COUNT(id) FROM student').next[0]
  end


  private

  attr_accessor :client

  def student_fields(student)
    [student.first_name, student.last_name,  student.dadname, student.telephone, student.telegram, student.mail, student.git]
  end
end