from django.urls import path
from . import views

urlpatterns = [
    path('', views.profiles, name="profiles"),
    path('login/', views.loginUser, name="login"),
    path('logout/', views.logoutUser, name="logout"),
    path('register/', views.registerUser, name="register"),
    path('courses/', views.courses, name="courses"),
    path('instructors/', views.instructors, name="instructors"),
    path('course/<str:pk>', views.course, name="course"),
    path('instructor/<str:pk>', views.instructor, name="instructor"),
    path('enroll/', views.enroll, name="enroll"),
    path('chartEnrollment', views.bar_chart_enrollment_json,
         name='bar_chart_enrollment_json'),
]
