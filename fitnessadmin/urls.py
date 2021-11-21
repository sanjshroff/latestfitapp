from django.urls import path
from . import views

urlpatterns = [
    path('home/', views.home, name="home"),
    path('session/', views.sessions, name="session"),
    path('students/', views.students, name="students"),
    path('courses/', views.courses, name="admincourses"),
    path('course/<str:pk>', views.course, name="course"),

    path('addcourse/', views.addcourse, name="addcourse"),
    path('editcourse/<str:pk>/', views.editcourse, name="editcourse"),
    path('deletecourse/<str:pk>/', views.deletecourse, name="deletecourse"),

    path('instructors/', views.instructors, name="admininstructors"),
    path('instructor/<str:pk>', views.instructor, name="instructor"),
    path('addInstructor/', views.addInstructor, name="addInstructor"),
    path('editInstructor/<str:pk>/', views.editInstructor, name="editInstructor"),
    path('deleteInstructor/<str:pk>/', views.deleteInstructor, name="deleteInstructor"),

    #dont push
    path('enroll/', views.addEnrollment, name="addEnrollment"),
    path('enrolled/', views.Enrollment, name="Enrollment"),
]