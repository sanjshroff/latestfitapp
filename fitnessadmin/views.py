from django.shortcuts import redirect, render

# Create your views here.
from django.http import HttpResponse
import MySQLdb
from fitnessadmin.models import Instructor, Student, Course, Enroll
from .forms import CourseForm, InstructorForm, EnrollForm

def home(request):
    return render(request, "home.html")

def sessions(request):
    return HttpResponse("<h1>Sessions available today are:</h1>")

def students(request):
    students = Student.objects.all()
    context = {'students': students}
    return render(request, "fitnessadmin/students.html", context)

def courses(request):
    courses = Course.objects.all()
    context = {'courses': courses}
    return render(request, "fitnessadmin/courses.html", context)

def course(request, pk):
    return HttpResponse("<h1>{{pk}}</h1>")

def addcourse(request):
    form = CourseForm()

    if request.method == "POST":
        form =  CourseForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('admincourses')
        print(request.POST)
    context = {'form': form}
    return render(request, "fitnessadmin/addcourse.html", context)

def editcourse(request, pk):
    course = Course.objects.get(courseid=pk)
    form = CourseForm(instance=course)

    if request.method == "POST":
        form =  CourseForm(request.POST, instance=course)
        if form.is_valid():
            form.save()
            return redirect('admincourses')
        print(request.POST)
    context = {'form': form}
    return render(request, "fitnessadmin/editCourse.html", context)

def deletecourse(request, pk):
    course = Course.objects.get(courseid=pk)

    if request.method == "POST":
        course.delete()
        return redirect('admincourses')
    context = {'object': course}
    return render(request, "fitnessadmin/deleteCourse.html", context)

def instructors(request):
    instructors = Instructor.objects.all()
    context = {'instructors': instructors}
    return render(request, "fitnessadmin/instructors.html", context)

def instructor(request, pk):
    return HttpResponse("<h1>{{pk}}</h1>")

def addInstructor(request):
    form = InstructorForm()

    if request.method == "POST":
        form =  InstructorForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('admininstructors')
        print(request.POST)
    context = {'form': form}
    return render(request, "fitnessadmin/addinstructor.html", context)

def editInstructor(request, pk):
    instructor = Instructor.objects.get(instructorid=pk)
    form = InstructorForm(instance=instructor)

    if request.method == "POST":
        form =  InstructorForm(request.POST, instance=instructor)
        if form.is_valid():
            form.save()
            return redirect('admininstructors')
        print(request.POST)
    context = {'form': form}
    return render(request, "fitnessadmin/editInstructor.html", context)

def deleteInstructor(request, pk):
    instructor = Instructor.objects.get(instructorid=pk)

    if request.method == "POST":
        instructor.delete()
        return redirect('admininstructors')
    context = {'object': instructor}
    return render(request, "fitnessadmin/deleteInstructor.html", context)

def addEnrollment(request):
    form = EnrollForm()

    if request.method == "POST":
        form =  EnrollForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('admininstructors')
        print(request.POST)
    context = {'form': form}
    return render(request, "fitnessadmin/enrollment.html", context)

def Enrollment(request):
    enroll = Enroll.objects.all()
    context = {'enroll': enroll}
    return render(request, "fitnessadmin/enroll.html", context)