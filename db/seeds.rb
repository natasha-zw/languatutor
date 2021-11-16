# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

subjects = Subject.create([{name: 'English'}, {name: 'Japanese'}, {name: 'Korean'}, {name: 'Spanish'}, {name: 'Bahasa Indonesian'}, {name: 'Arabic'}, {name: 'French'}, {name: 'Hindi'}, {name: 'Mandarin Chinese'}, {name: 'Urdu'}])

roles = Role.create!([{name: :admin}, {name: :tutor}, {name: :student}])

admin = User.create!(first_name: 'Taylor', last_name: 'Grace', email: 'admin@test.com', password: 'password').add_role(:admin)

students = User.create!([
                          { first_name: 'James', last_name: 'Brown', email: 'student1@test.com', password: 'password' },
                          { first_name: 'Melodie', last_name: 'Maurukira', email: 'student2@test.com', password: 'password' },
                          { first_name: 'Aaron', last_name: 'Bridges', email: 'student3@test.com', password: 'password' },
                          { first_name: 'Meiwen', last_name: 'Chen', email: 'student4@test.com', password: 'password' }
                        ])
students.each do|student|
    student.add_role(:student)
end 

tutors = User.create!([
                          { first_name: 'Lara', last_name: 'Lee', email: 'teacher1@test.com', password: 'password' },
                          { first_name: 'Tapiwa', last_name: 'Munyanga', email: 'teacher2@test.com', password: 'password' }, 
                          { first_name: 'Jessica', last_name: 'Lim', email: 'teacher3@test.com', password: 'password' },
                          { first_name: 'Paolo', last_name: 'Valentines', email: 'teacher4@test.com', password: 'password' }
                        ])
tutors.each do |tutor|
    tutor.add_role(:tutor)
end 

Course.create([
                {name: 'Beginner', description: 'Beginner level course for subject', price: 2000, subject_id: Subject.first.id, tutor_id: tutors.first.id },
                {name: 'Intermediate', description: 'Intermediate level course for subject', price: 3000, subject_id: Subject.find(2).id, tutor_id: tutors.second.id },
                {name: 'Advanced', description: 'Advanced level course for subject', price: 4000, subject_id: Subject.find(3).id, tutor_id: tutors.third.id },
                {name: 'Beginner', description: 'Beginner level course for subject', price: 2000, subject_id: Subject.find(4).id, tutor_id: tutors.first.id }
])
