from django.shortcuts import redirect, render

# Create your views here.
from django.http import HttpResponse
import MySQLdb
from fitnessadmin.models import Student, Course
from .forms import CourseForm

def index(request):
    return HttpResponse("<h1>Welcome to Fitness World!</h1>")

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

def addcourse(request):
    form = CourseForm()

    if request.method == "POST":
        form =  CourseForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('courses')
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
            return redirect('courses')
        print(request.POST)
    context = {'form': form}
    return render(request, "fitnessadmin/addcourse.html", context)

def deletecourse(request, pk):
    course = Course.objects.get(courseid=pk)

    if request.method == "POST":
        course.delete()
        return redirect('courses')
    context = {'object': course}
    return render(request, "fitnessadmin/delete.html", context)