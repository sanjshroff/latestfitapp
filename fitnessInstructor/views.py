from django.shortcuts import redirect, render

from django.contrib.auth.models import User
from django.contrib import messages
from django.http.response import HttpResponse
from django.shortcuts import redirect, render
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import UserCreationForm

from django.http import HttpResponse
from fitnessadmin.models import Instructor, Student, Course, Enroll


def instructorloginUser(request):
    if request.method == 'POST':
        instructors = Instructor.objects.all()
        context = {'instructors': instructors}
        return render(request, 'instructors.html', context)

    return render(request, 'instructorlogin.html')

def course(request, pk):
    course = Course.objects.get(courseid=pk)
    context = {'course': course}
    return render(request, 'single-course.html', context)


def courses(request):
    courses = Course.objects.all()
    context = {'courses': courses}
    return render(request, "courses.html", context)

def viewallInstructors(request):
    instructors = Instructor.objects.all()
    context = {'instructors': instructors}
    return render(request, "instructors.html", context)
    


def instructorbyId(request, pk):
    instructor = Instructor.objects.get(instructorid=pk)
    context = {'instructor': instructor}
    return render(request, 'instructor-profile.html', context)


# def instructorloginUser(request):
#     page = 'login'
#     context = {"page": page}

#     # if request.user.is_authenticated:
#     #     return redirect('profiles')

#     if request.method == 'POST':
#         username = request.POST['username'].lower()
#         print(username)
#         password = request.POST['password']
#         print(password)
#         try:
#             user = Instructor.objects.get(instructorname="hem")
        
#         except:
#             print("error ")
#             messages.error(request, 'Username does not exist')
#             return render(request, 'instructorlogin.html')

#     return render(request, 'instructorlogin.html', context)
