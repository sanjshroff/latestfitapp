from django.contrib.auth.models import User
from django.contrib import messages
from django.http.response import HttpResponse
from django.shortcuts import redirect, render
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import UserCreationForm
from django.db.models import Q
from .utils import searchInstructors

from .forms import CustomUserCreationForm

from fitnessadmin.models import Course, Instructor, Enroll
# Create your views here.


def profiles(request):
    return render(request, 'users/profiles.html')

def loginUser(request):
    page = 'login'
    context = {"page": page}

    if request.user.is_authenticated:
        return redirect('profiles')

    if request.method == 'POST':
        username = request.POST['username'].lower()
        password = request.POST['password']
        try:
            user = User.objects.get(username=username)
        except:
            messages.error(request, 'Username does not exist')
            return render(request, 'users/login_register.html')

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            return redirect('profiles')
            #return redirect(request.GET['next'] if 'next' in request.GET else 'account')

        else:
            messages.error(request, 'Username OR password is incorrect')
            
    return render(request, 'users/login_register.html', context)
    #return HttpResponse("<h1>ogin required</h1>")

def logoutUser(request):
    logout(request)
    return redirect('login')

def registerUser(request):
    page = 'register'
    form = CustomUserCreationForm()

    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save(commit=False)
            user.username = user.username.lower()
            user.save()

            messages.success(request, 'User account was created!')

            login(request, user)
            return redirect('profiles')

        else:
            messages.success(
                request, 'An error has occurred during registration')

    context = {'page': page, 'form': form}
    return render(request, 'users/login_register.html', context)

@login_required(login_url='login')
def courses(request):
    courses = Course.objects.all()
    context = {'courses': courses}
    return render(request, "users/courses.html", context)

@login_required(login_url='login')
def course(request, pk):
    course = Course.objects.get(courseid=pk)
    context = {'course': course}
    return render(request, 'users/single-course.html', context)

@login_required(login_url='login')
def instructors(request):
    instructors, search_query = searchInstructors(request)
    context = {'instructors': instructors, 'search_query': search_query}
    return render(request, "users/instructors.html", context)

@login_required(login_url='login')
def instructor(request, pk):
    instructor = Instructor.objects.get(instructorid=pk)
    context = {'instructor': instructor}
    return render(request, 'users/instructor-profile.html', context)

@login_required(login_url='login')
def enroll(request):
    enroll = Enroll.objects.all()
    context = {'enroll': enroll}
    return render(request, 'users/enroll.html', context)