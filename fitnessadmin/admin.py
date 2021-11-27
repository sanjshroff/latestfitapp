from django.contrib import admin

# Register your models here.
from .models import Instructor, Course, Enroll
from users.models import Student

admin.site.register(Student)

admin.site.register(Instructor)

admin.site.register(Course)

admin.site.register(Enroll)