
class StudentsListDB

  def initialize(db_file_path)
    self.client = SQLite3::Database.open db_file_path
  end

  def student_by_id(student_id)
    client.results_as_hash = true
    hash = client.prepare('SELECT * FROM student WHERE id = ?').execute(student_id).first
    client.results_as_hash = false
    return nil if hash.nil?

    Student.from_hash(hash)

  end


  def add_student(student)
    stmt = client.prepare('insert into student (first_name, last_name, dadname, telephone, telegram, mail, git) VALUES (?, ?, ?, ?, ?, ?, ?)')
    stmt.execute(*student_fields(student))
    self.client.query('SELECT seq from sqlite_sequence where name = "student"').first.first[1]
  end

  def remove_student(student_id)
    stmt = self.client.prepare('DELETE FROM student WHERE id = ?')
    stmt.execute(student_id)
  end

  def replace_student(student_id, student)
    stmt = client.prepare('UPDATE student SET first_name=?, last_name=?, dadname=?, telephone=?, telegram=?, mail=?, git=? WHERE id=?')
    stmt.execute(*student_fields(student), student_id)
  end

  def student_count
    stm = self.client.prepare "Select COUNT(id) from student"
    stm.execute.next[0]
  end


  private

  attr_accessor :client

  def student_fields(student)
    [student.first_name, student.last_name,  student.dadname, student.telephone, student.telegram, student.mail, student.git]
  end
end