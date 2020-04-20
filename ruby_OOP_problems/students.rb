class Students
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(name)
    self.grade > name.grade
  end

  protected

  def grade
    @grade
  end
end

krunal = Students.new("Krunal", 17)
patel = Students.new("Patel", 19)
puts "Well done!" if krunal.better_grade_than?(patel)
