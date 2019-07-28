class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |hash,k| hash[k] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(teacher)
        teachers << teacher
    end

    def enroll(student)
        if self.students.length >= @student_capacity
            return false
        else
            students << student
            return true
        end
    end

    def enrolled?(student)
        return students.include?(student)
    end

    def student_to_teacher_ratio
        return (students.length / teachers.length).floor
    end

    def add_grade(student, grade)
        if students.include?(student) == false
            return false
        else
            @grades[student] << grade
            return true
        end
    end

    def num_grades(student)
        return @grades[student].length
    end

    def average_grade(student)
        if !students.include?(student) || @grades[student] == []
            return nil
        else
            return (@grades[student].sum/@grades[student].length).floor
        end
    end


end
