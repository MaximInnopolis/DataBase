# This is a Chen Notation diagram for lab 1

### Eremov Artur B20-02 a.eremov@innopolis.university 
### Petrov Ignat B20-02 ig.petrov@innopolis.university
### Gia Trong Nguyen B20-02 g.nguyen@innoplis.university
### Latypov Maxim B20-02 m.latypov@innopolis.university
### Zhukov Rostislav B20-02 ro.zhukov@innopolis.university


We have a table “Attempts” which is used for collecting all attempts of students to pass the exam of some course. Attempts have year, semester, mark and grade fields.

Field Student used for collecting information about university students. Students have given names, a surname, a student identifier, a date of birth, and the year they first enrolled. Key attribute is the student identifier.

A program has a name, the total credit points required to graduate, the year it commenced, and program identifier as primary key. 

Every course in university has such fields as name, course identifier, credit points needed to pass this course and the year course commenced.

Every student has to enroll in one of the programs. Every program contains several courses. Students and courses through attempts have many to many connections, which means that different students can have the same courses.
