using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Hosting;

namespace Feedback_Sys
{
     public static class GlobalVariables
    {
        public static string studentsFilePath = HostingEnvironment.MapPath(@"~\Students.txt");
        public static string coursesFilePath = HostingEnvironment.MapPath(@"~\Courses.txt");
        public static string CoursesServays = HostingEnvironment.MapPath(@"~\CourseraServices.txt");
    }

    public class Course
    {
        public string Id;
        public string Name;
        public string Description;
        public string Instructor;
        public int DurationInWeeks;
        public string Level;
        public int Price;
        public string Image;
        public Course(string id, string name, string description, string instructor, int durationInWeeks, string level, int price, string image)
        {
            Id = id;
            Name = name;
            Description = description;
            Instructor = instructor;
            DurationInWeeks = durationInWeeks;
            Level = level;
            Price = price;
            Image = image;
        }

        public static Course CreateFromString(string courseString)
        {
            string[] fields = courseString.Split(',');
            Course course = new Course(fields[0], fields[1], fields[2], fields[3], int.Parse(fields[4]), fields[5], int.Parse(fields[6]), fields[7]);
            return course;
        }

        public string ConvertToString()
        {
            string courseString = Id + "," + Name + "," + Description + "," + Instructor + "," + DurationInWeeks + "," + Level + "," + Price + "," + Image;
            return courseString;
        }

        public static Course CreateNew(string name, string description, string instructor, int durationInWeeks, string level, int price, string image)
        {
            Course course = new Course(Guid.NewGuid().ToString(), name, description, instructor, durationInWeeks, level, price, image);
            return course;
        }
    }

    public class StudentCourse
    {

        public Course TheCourse;
        public bool HasBeenReviewed;
        public StudentCourse(Course course, bool hasBeenReviewed)
        {
            TheCourse = course;
            HasBeenReviewed = hasBeenReviewed;
        }
        override public string ToString()
        {
            if (HasBeenReviewed)             
            return $"{TheCourse.Id}-true";
            return $"{TheCourse.Id}-false";
        }
    }

    public class StudentCoursesList : List<StudentCourse>
    {
        public StudentCourse GetCourseById(string id)
        {
            foreach (StudentCourse course in this)
            {
                if (course.TheCourse.Id == id)
                {
                    return course;
                }
            }
            throw new Exception("Could not find course with id: " + id);
        }

        public void MarkCourseAsReviewed(string id)
        {
            foreach (StudentCourse course in this)
            {
                if (course.TheCourse.Id == id)
                {
                    course.HasBeenReviewed = true;
                    return;
                }
            }
            throw new Exception("Course not found");
        }

        public void AddCourse(Course course, bool hasBeenReviewed)
        {
            try
            {
                FindCourseById(course.Id);
                System.Console.WriteLine("Course already exists");
            }
            catch (System.Exception)
            {
                Add(new StudentCourse(course, hasBeenReviewed));
                System.Console.WriteLine("Course has been added");
            }
        }
        public void AddCourse(string courseId)
        {
            Course course = CoursesList.All().GetCourseById(courseId);
            AddCourse(course);
        }
        public void AddCourse(string courseId, bool hasBeenReviewed)
        {
            Course course = CoursesList.All().GetCourseById(courseId);
            AddCourse(course, hasBeenReviewed);
        }
        public void AddCourse(Course course)
        {
            AddCourse(course, false);
        }
        public void RemoveCourse(Course course)
        {
            Remove(FindCourseById(course.Id));
        }
        public void RemoveCourse(string id)
        {
            Remove(FindCourseById(id));
        }

        public static StudentCoursesList CreateFromString(string StudentCoursesString)
        {
            if (StudentCoursesString == "")
                return new StudentCoursesList();
            CoursesList courses = CoursesList.All();
            string[] coursesStrings = StudentCoursesString.Split(' ');
            StudentCoursesList studentCourses = new StudentCoursesList();
            foreach (string courseString in coursesStrings)
            {
                string[] courseFields = courseString.Split('-');
                StudentCourse studentCourse = new StudentCourse(courses.GetCourseById(courseFields[0]), courseFields[1].Equals("true", StringComparison.CurrentCultureIgnoreCase));
                studentCourses.Add(studentCourse);
            }
            return studentCourses;
        }

        override public string ToString()
        {
            string studentCoursesString = "";
            foreach (StudentCourse studentCourse in this)
            {
                studentCoursesString +=studentCourse.ToString()+" " ;
            }
            return studentCoursesString.Trim();
        }

        public StudentCourse FindCourseById(string id)
        {
            foreach (StudentCourse studentCourse in this)
            {
                if (studentCourse.TheCourse.Id == id.Trim())
                {
                    return studentCourse;
                }
            }
            throw new Exception("Could not find course with id: " + id);
        }
        // This might be wrong, check later
        public StudentCoursesList GetStudentCourses(string studentId)
        {
            StudentsList students = StudentsList.All();
            Student student = students.GetStudentById(studentId);
            return student.Courses;
        }
    }



    public class CoursesList : List<Course>
    {
        public Course GetCourseById(string id)
        {
            foreach (Course course in this)
            {
                if (course.Id == id)
                {
                    return course;
                }
            }
            throw new Exception("Course not found");
        }
        public static CoursesList All()
        {
            // Read courses from file
            CoursesList courses = new CoursesList();
            if (!File.Exists(GlobalVariables.coursesFilePath))
                throw new Exception("Courses file not found ");
            string[] lines = File.ReadAllLines(GlobalVariables.coursesFilePath);
            foreach (string line in lines)
            {
                string[] fields = line.Split(',');
                courses.Add(new Course(fields[0], fields[1], fields[2], fields[3], int.Parse(fields[4]), fields[5], int.Parse(fields[6]), fields[7]));
            }
            return courses;
        }

        public void SaveToFile(string coursesFilePath)
        {
            if (!File.Exists(coursesFilePath))
                throw new Exception("Courses file not found");
            string[] lines = new string[this.Count];
            for (int i = 0; i < this.Count; i++)
            {
                lines[i] = this[i].ConvertToString();
            }
            File.WriteAllLines(coursesFilePath, lines);
        }
        public void SaveToFile()
        {
            SaveToFile(GlobalVariables.coursesFilePath);
        }
    }


    public class Student
    {

        public string Id;
        public string Name;
        public Student(string id, string name, string email, string nationalId, int age, string phone, string bio, StudentCoursesList courses)
        {
            Id = id;
            Name = name;
            if (!Regex.IsMatch(email, @"^[a-zA-Z0-9\._-]+@[a-zA-Z0-9\._-]+\.[a-zA-Z]{2,5}$"))
                throw new Exception("Invalid email");
            Email = email;
            if (!Regex.IsMatch(nationalId, @"^\d{10}$"))
                throw new Exception("Invalid nationalId, nationalId should be 10 digets strig");
            NationalId = nationalId;
            if (age < 5 || age > 150)
                throw new Exception("Invalid age, age should be between 5 and 150");
            Age = age;
            if (!Regex.IsMatch(phone, @"^07[789]\d{7}$"))
                throw new Exception("Invaled Phone number: phone should be in the form 07(7/8/9)xxxxxxx");
            Phone = phone;
            Bio = bio;
            Courses = courses;
        }
        // validate email

        public string Email;
        public string NationalId;
        public int Age;
        public string Phone;
        public string Bio;
        public StudentCoursesList Courses;

        public static Student CreateFromString(string studentString)
        {
            // studentString in the format id,name,email,nationalID,age,phone,pio,COURSES
            string[] fields = studentString.Split(',');
            var studentCourses = new StudentCoursesList();
            if (fields[7].Trim().Length > 0)
                studentCourses = StudentCoursesList.CreateFromString(fields[7]);
            Student student = new Student(fields[0], fields[1], fields[2], fields[3], int.Parse(fields[4]), fields[5], fields[6], studentCourses);
            return student;
        }

        public string ConvertToString()
        {
            string studentString = Id + "," + Name + "," + Email + "," + NationalId + "," + Age + "," + Phone + "," + Bio + "," + Courses.ToString();
            return studentString;
        }
        public Student CreateNew(string name, string email, string nationalId, int age, string phone, string bio)
        {
            Student student = new Student(Guid.NewGuid().ToString(), name, email, nationalId, age, phone, bio, Courses);
            return student;
        }

        public bool Equals(Student obj)
        {
            return obj.Id == Id;
        }
    }

    public class StudentsList : List<Student>
    {
        public Student GetStudentById(string id)
        {
            foreach (Student student in this)
            {
                if (student.Id == id)
                {
                    return student;
                }
            }
            throw new Exception("Student not found with id: " + id);
        }

        public Student GetStudentByName(string name)
        {
            foreach (Student student in this)
            {
                if (student.Name == name)
                {
                    return student;
                }
            }
            throw new Exception("Student not found with name: " + name);
        }

        public Student GetStudentByNationalId(string nationalId)
        {
            foreach (Student student in this)
            {
                if (student.NationalId == nationalId)
                {
                    return student;
                }
            }
            throw new Exception("Student not found with national id: " + nationalId);
        }

        public StudentsList FilterByName(string name)
        {
            StudentsList filteredStudents = new StudentsList();
            foreach (Student student in this)
            {
                if (student.Name.Contains(name))
                {
                    filteredStudents.Add(student);
                }
            }
            return filteredStudents;
        }

        public void UpdateStudent(Student student)
        {
            foreach (Student s in this)
            {
                if (s.Id == student.Id)
                {
                    this[IndexOf(s)] = student;
                    break;
                }
            }
        }
        public static StudentsList All()
        {
            StudentsList students = new StudentsList();
            if (!File.Exists(GlobalVariables.studentsFilePath))
                throw new Exception("Students file not found");
            string[] lines = File.ReadAllLines(GlobalVariables.studentsFilePath);
            foreach (string line in lines)
            {
                string[] fields = line.Split(',');
                StudentCoursesList courses = StudentCoursesList.CreateFromString(fields[7]);
                students.Add(new Student(fields[0], fields[1], fields[2], fields[3], int.Parse(fields[4]), fields[5], fields[6], courses));
            }
            return students;
        }

        public void SaveToFile(string studentsFilePath)
        {
            if (!File.Exists(studentsFilePath))
                throw new Exception("Students file not found");
            string[] lines = new string[this.Count];
            for (int i = 0; i < this.Count; i++)
            {
                lines[i] = this[i].ConvertToString();
            }
            File.WriteAllLines(studentsFilePath, lines);
        }

        public void SaveToFile()
        {
            SaveToFile(GlobalVariables.studentsFilePath);
        }

        public void DeleteStudent(Student student)
        {
            Remove(GetStudentById(student.Id));
        }
        public void DeleteStudent(string id)
        {
            Remove(GetStudentById(id));
        }

        public new void Add(Student item)
        {
            // check if the id is already in the list
            if (this.Any(s => s.Id == item.Id))
                throw new Exception("Student with id: " + item.Id + " already exists");
            // check if the national id is already in the list
            if (this.Any(s => s.NationalId == item.NationalId))
                throw new Exception("Student with national id: " + item.NationalId + " already exists");
            // check if the email is already in the list
            if (this.Any(s => s.Email == item.Email))
                throw new Exception("Student with email: " + item.Email + " already exists");
            // check if the name is already in the list
            if (this.Any(s => s.Name == item.Name))
                throw new Exception("Student with name: " + item.Name + " already exists");
            base.Add(item);
        }
    }

    class CourseServay
    {
        public Course course;
        public string[] qustions = new string[10];
        public CourseServay(string[] qustions, Course course)
        {

            if (qustions.Length != 10)
                throw new Exception("CourseSurvey questions must be exactly 10 qustions.");
            this.qustions = qustions;
            this.course = course;
        }
        public CourseServay(string[] qustions, string courseId)
        {
            if (qustions.Length != 10)
                throw new Exception("CourseSurvey questions must be exactly 10 qustions.");
            this.qustions = qustions;
            Course course = CoursesList.All().GetCourseById(courseId);
            this.course = course;
        }
        static public CourseServay ReadFromFile(string coursId)
        {
            if (!File.Exists(GlobalVariables.CoursesServays))
                throw new Exception("Courses file not found ");
            string[] lines = File.ReadAllLines(GlobalVariables.CoursesServays);
            foreach (string line in lines)
            {
                string[] fields = line.Split(',');
                if (fields[0] == coursId)
                {
                    string[] qustions = fields.Skip(1).ToArray();
                    return new CourseServay(qustions, coursId);
                }
            }
            throw new Exception("Cours IDcoudent be found in the servay qustions file");
        }

        public void SaveToFile()
        {
            if (!File.Exists(GlobalVariables.CoursesServays))
                throw new Exception("Courses file not found ");

            string[] lines = File.ReadAllLines(GlobalVariables.CoursesServays);
            bool found = false;

            for (int i = 0; i < lines.Length; i++)
            {
                string[] fields = lines[i].Split(',');
                if (fields[0] == course.Id)
                {
                    lines[i] = course.Id + "," + string.Join(",", qustions);
                    found = true;
                    break;
                }
            }

            if (!found)
                throw new Exception("Course ID couldn't be found in the survey questions file");
            File.WriteAllLines(GlobalVariables.CoursesServays, lines);
        }
    }
}