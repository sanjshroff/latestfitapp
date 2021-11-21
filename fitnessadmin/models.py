from django.db import models

class Student(models.Model):
    studentid = models.AutoField(db_column='studentId', primary_key=True)  # Field name made lowercase.
    studentfirstname = models.CharField(db_column='studentFirstName', max_length=45)  # Field name made lowercase.
    studentphonenumber = models.CharField(db_column='studentPhoneNumber', max_length=45)  # Field name made lowercase.
    studentlastname = models.CharField(db_column='studentLastName', max_length=45, blank=True, null=True)  # Field name made lowercase.
    studentemailid = models.EmailField(db_column='studentEmailId', max_length=45)  # Field name made lowercase.
    studentpassword = models.CharField(db_column='studentPassword', max_length=45)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'student'
    
    def __str__(self):
        return self.studentfirstname

class Instructor(models.Model):
    instructorid = models.AutoField(db_column='instructorId', primary_key=True)  # Field name made lowercase.
    instructorname = models.CharField(db_column='instructorName', max_length=45)  # Field name made lowercase.
    instructorcourse = models.CharField(db_column='instructorCourse', max_length=45, blank=True, null=True)  # Field name made lowercase.
    instructorskills = models.CharField(db_column='instructorSkills', max_length=45, blank=True, null=True)  # Field name made lowercase.
    instructorphonenumber = models.CharField(db_column='instructorPhoneNumber', max_length=45)  # Field name made lowercase.
    instructoremail = models.CharField(db_column='instructorEmail', max_length=45)  # Field name made lowercase.
    featured_image = models.ImageField(
        null=True, blank=True, default="default.jpg")
    created = models.DateTimeField(auto_now_add=True)


    class Meta:
        managed = False
        db_table = 'instructor'
    
    def __str__(self):
        return self.instructorname

class Course(models.Model):
    courseid = models.AutoField(db_column='courseId', primary_key=True)  # Field name made lowercase.
    coursename = models.CharField(db_column='courseName', max_length=45)  # Field name made lowercase.
    coursedescription = models.CharField(db_column='courseDescription', max_length=100, blank=True, null=True)  # Field name made lowercase.
    trainer = models.ForeignKey('Instructor', models.DO_NOTHING, db_column='trainer', blank=True, null=True)
    featured_image = models.ImageField(
        null=True, blank=True, default="default.jpg")
    zoom_link = models.CharField(max_length=2000, null=True, blank=True)
    created = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'course'
    
    def __str__(self):
        return self.coursename
class Enroll(models.Model):
    studentid = models.ForeignKey('Student', models.DO_NOTHING, db_column='studentId')  # Field name made lowercase.
    courseid = models.ForeignKey(Course, models.DO_NOTHING, db_column='courseId')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'enroll'