from django.contrib.auth.models import User
from django.contrib import messages
from django.http.response import HttpResponse, JsonResponse
from django.shortcuts import redirect, render
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import UserCreationForm
from django.db.models import Q
from .utils import searchCourses, searchInstructors
from django.views.generic import TemplateView
from chartjs.views.lines import BaseLineChartView
from .forms import CustomUserCreationForm
import mysql.connector
from fitnessadmin.models import Course, Instructor, Enroll
from .models import Student
# Create your views here.
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="admin123",
    database="fitnessdb"
)
mycursor = mydb.cursor()

mycursor.execute(
    """SELECT count(*),c.courseName FROM enroll e, course c where e.courseid=c.courseId  group by e.courseid""")

myresult = mycursor.fetchall()
print(myresult)

mycursor.execute(
    """SELECT count(*),i.instructorName FROM instructor i, course c where c.trainer = i.instructorid group by i.instructorId;""")
myresultIns = mycursor.fetchall()
print(myresultIns)


def bar_chart_enrollment_json(request):

    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="admin123",
        database="fitnessdb"
    )
    mycursor = mydb.cursor()

    mycursor.execute(
        """SELECT count(*),c.courseName FROM enroll e, course c where e.courseid=c.courseId  group by e.courseid""")

    myresult = mycursor.fetchall()
    print(myresult)
    mycursor.execute(
        """SELECT count(*),i.instructorName FROM instructor i, course c where c.trainer = i.instructorid group by i.instructorId;""")
    myresultIns = mycursor.fetchall()
    print(myresultIns)
    labels = [value[1] for value in myresult]
    data = [value[0] for value in myresult]

    labels1 = [value[1] for value in myresultIns]
    data1 = [value[0] for value in myresultIns]
    return JsonResponse(data={
        'labels': labels,
        'data': data,
        'labels1': labels1,
        'data1': data1,
    })


def profiles(request):

    return render(request, 'dashboard.html')


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
            # return redirect(request.GET['next'] if 'next' in request.GET else 'account')

        else:
            messages.error(request, 'Username OR password is incorrect')

    return render(request, 'users/login_register.html', context)
    # return HttpResponse("<h1>ogin required</h1>")


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

            try:
                print("USERname!!!!!!!", user.first_name)
                student = Student.objects.create(
                    user=user, name=user.first_name, email=user.email, username=user.username)
                student.save()
                messages.success(request, 'User account was created!')
                login(request, user)
            except:
                messages.error(request, 'User account was not created!')

            return redirect('profiles')

        else:
            messages.error(
                request, 'An error has occurred during registration')

    context = {'page': page, 'form': form}
    return render(request, 'users/login_register.html', context)


@login_required(login_url='login')
def courses(request):

    if request.method == "POST":
        print(request.user.username)
        print(request.POST.get('data-course'))
        print(request.POST)
        # student = Student.objects.filter(Q(studentfirstname="Student1"))

        # course1 = Course.objects.filter(coursename="Yoga")
        # print(student[0].studentid)
        # print(course1)
        # enroll = Enroll.objects.create(studentid=student[0],courseid=course1[0])
        # enroll.save()
    courses, search_query = searchCourses(request)
    context = {'courses': courses, 'search_query': search_query}
    return render(request, "users/courses.html", context)


@login_required(login_url='login')
def course(request, pk):
    enrolledFlag = False
    existingFlag = True

    courseObj = Course.objects.filter(courseid=pk)
    studentObj = Student.objects.filter(username=request.user.username)
    enrollData = Enroll.objects.filter(Q(studentid=studentObj[0]) &
                                       Q(courseid=courseObj[0]))
    print(enrollData)

    if enrollData:
        enrolledFlag = True
        messages.success(
            request, "Already enrolled to {}".format(courseObj[0]))
    if request.method == "POST":
        print(pk)
        print(request.user.username)
        if request.POST["enroll"] == "Unsubscribe":
            enrollData.delete()
            messages.success(
                request, "Unsubscribed from {}".format(courseObj[0]))
            return redirect('courses')

        elif not enrollData:
            enroll = Enroll.objects.create(
                studentid=studentObj[0], courseid=courseObj[0])
            enroll.save()
            messages.success(
                request, "Successfully enrolled to {}".format(courseObj[0]))
            enrolledFlag = True

    course = Course.objects.get(courseid=pk)
    context = {'course': course, 'enrolledFlag': enrolledFlag}
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
    print("Requested user", request.user.username)
    courseList = []
    courseidList = []
    context = {'courses': courseList}
    try:
        allStudents = Student.objects.all()
        print(allStudents)
        studentObj = Student.objects.filter(username=request.user.username)
        print("Student object:", studentObj)
        print("Student object ID:", type(studentObj[0].id))

        enroll = Enroll.objects.filter(studentid=studentObj[0].id)
        print("Enroll details: ", enroll)
        for e in enroll:
            print(e.courseid.courseid)
            if e.courseid.courseid not in courseidList:
                courseidList.append(e.courseid.courseid)
                courseList.append(e.courseid)
            print(courseList)
        context = {'courses': courseList}
        return render(request, 'users/enroll.html', context)
    except Exception as e:
        return render(request, 'users/enroll.html', context)
