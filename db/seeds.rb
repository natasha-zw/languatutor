# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

subjects = Subject.create([{name: 'English'}, {name: 'Japanese'}, {name: 'Korean'}, {name: 'Spanish'}, {name: 'Bahasa Indonesian'}, {name: 'Arabic'}, {name: 'French'}, {name: 'Hindi'}, {name: 'Mandarin Chinese'}, {name: 'Urdu'}])

roles = Role.create!([{name: :admin}, {name: :tutor}, {name: :student}])

admin = User.create!(first_name: 'Taylor', last_name: 'Grace', email: 'admin@test.com', password: 'password', roles: [Role.find_by(name: "admin")])


# Students
students = User.create!([
                          { first_name: 'James', last_name: 'Brown', email: 'student1@test.com', password: 'password', roles: [Role.find_by(name: "student")] },
                          { first_name: 'Melodie', last_name: 'Rose', email: 'student2@test.com', password: 'password', roles: [Role.find_by(name: "student")]},
                          { first_name: 'Ashlee', last_name: 'Maurukira', email: 'student3@test.com', password: 'password', roles: [Role.find_by(name: "student")]},
                          { first_name: 'Desiree', last_name: 'Williams', email: 'student4@test.com', password: 'password', roles: [Role.find_by(name: "student")]},
                          { first_name: 'Meiwen', last_name: 'Chen', email: 'student5@test.com', password: 'password', roles: [Role.find_by(name: "student")] },
                          { first_name: 'Aaron', last_name: 'Bridges', email: 'student6@test.com', password: 'password', roles: [Role.find_by(name: "student")]},
                          { first_name: 'Dillan', last_name: 'Reeves', email: 'student7@test.com', password: 'password', roles: [Role.find_by(name: "student")] },
                          { first_name: 'Chris', last_name: 'Mpofu', email: 'student8@test.com', password: 'password', roles: [Role.find_by(name: "student")] },
                          { first_name: 'Michael', last_name: 'Kheiri', email: 'student9@test.com', password: 'password', roles: [Role.find_by(name: "student")]},
                          { first_name: 'Vincent', last_name: 'Ramirez', email: 'student10@test.com', password: 'password', roles: [Role.find_by(name: "student")] },

                        ])


students.at(0).profile_photo.attach(io: File.open('./public/profile_images/student_1.jpg'), filename: 'student_1.jpg')
students.at(1).profile_photo.attach(io: File.open('./public/profile_images/student_2.jpg'), filename: 'student_2.jpg')
students.at(2).profile_photo.attach(io: File.open('./public/profile_images/student_3.jpg'), filename: 'student_3.jpg')
students.at(3).profile_photo.attach(io: File.open('./public/profile_images/student_4.jpg'), filename: 'student_4.jpg')
students.at(4).profile_photo.attach(io: File.open('./public/profile_images/student_5.jpg'), filename: 'student_5.jpg')
students.at(5).profile_photo.attach(io: File.open('./public/profile_images/student_6.jpg'), filename: 'student_6.jpg')
students.at(6).profile_photo.attach(io: File.open('./public/profile_images/student_7.jpg'), filename: 'student_7.jpg')
students.at(7).profile_photo.attach(io: File.open('./public/profile_images/student_8.jpg'), filename: 'student_8.jpg')
students.at(8).profile_photo.attach(io: File.open('./public/profile_images/student_9.jpg'), filename: 'student_9.jpg')
students.at(9).profile_photo.attach(io: File.open('./public/profile_images/student_10.jpg'), filename: 'student_10.jpg')


# Tutors
tutors = User.create!([
                        { first_name: 'Lara', last_name: 'Lee', email: 'tutor1@test.com', password: 'password', roles: [Role.find_by(name: "tutor")] },
                        { first_name: 'Havana', last_name: 'Alexander', email: 'tutor2@test.com', password: 'password', roles: [Role.find_by(name: "tutor")] },
                        { first_name: 'Tinashe', last_name: 'Munyanga', email: 'tutor3@test.com', password: 'password', roles: [Role.find_by(name: "tutor")] }, 
                        { first_name: 'Farah', last_name: 'Hosseini', email: 'tutor4@test.com', password: 'password', roles: [Role.find_by(name: "tutor")] },
                        { first_name: 'Jessica', last_name: 'Lim', email: 'tutor5@test.com', password: 'password', roles: [Role.find_by(name: "tutor")] },
                        { first_name: 'Chioma', last_name: 'Musa', email: 'tutor6@test.com', password: 'password', roles: [Role.find_by(name: "tutor")] },
                        { first_name: 'David', last_name: 'Kim', email: 'tutor7@test.com', password: 'password', roles: [Role.find_by(name: "tutor")] },
                        { first_name: 'William', last_name: 'Otieno', email: 'tutor8@test.com', password: 'password', roles: [Role.find_by(name: "tutor")] },
                        { first_name: 'Brandon', last_name: 'Keele', email: 'tutor9@test.com', password: 'password', roles: [Role.find_by(name: "tutor")] },
                        { first_name: 'Ahmet', last_name: 'Polat', email: 'tutor10@test.com', password: 'password', roles: [Role.find_by(name: "tutor")] }
                        ])


tutors.at(0).profile_photo.attach(io: File.open('./public/profile_images/tutor_1.jpg'), filename: 'tutor_1.jpg')
tutors.at(1).profile_photo.attach(io: File.open('./public/profile_images/tutor_2.jpg'), filename: 'tutor_2.jpg')
tutors.at(2).profile_photo.attach(io: File.open('./public/profile_images/tutor_3.jpg'), filename: 'tutor_3.jpg')
tutors.at(3).profile_photo.attach(io: File.open('./public/profile_images/tutor_4.jpg'), filename: 'tutor_4.jpg')
tutors.at(4).profile_photo.attach(io: File.open('./public/profile_images/tutor_5.jpg'), filename: 'tutor_5.jpg')
tutors.at(5).profile_photo.attach(io: File.open('./public/profile_images/tutor_6.jpg'), filename: 'tutor_6.jpg')
tutors.at(6).profile_photo.attach(io: File.open('./public/profile_images/tutor_7.jpg'), filename: 'tutor_7.jpg')
tutors.at(7).profile_photo.attach(io: File.open('./public/profile_images/tutor_8.jpg'), filename: 'tutor_8.jpg')
tutors.at(8).profile_photo.attach(io: File.open('./public/profile_images/tutor_9.jpg'), filename: 'tutor_9.jpg')
tutors.at(9).profile_photo.attach(io: File.open('./public/profile_images/tutor_10.jpg'), filename: 'tutor_10.jpg')




# Courses 
Course.create([
                {name: 'Beginner', description: 'Beginner level course for subject', price: 2000, subject_id: Subject.first.id, tutor_id: tutors.first.id },
                {name: 'Intermediate', description: 'Intermediate level course for subject', price: 3000, subject_id: Subject.find(2).id, tutor_id: tutors.second.id },
                {name: 'Advanced', description: 'Advanced level course for subject', price: 4000, subject_id: Subject.find(3).id, tutor_id: tutors.third.id },
                {name: 'Beginner', description: 'Beginner level course for subject', price: 2000, subject_id: Subject.find(4).id, tutor_id: tutors.first.id }
])
