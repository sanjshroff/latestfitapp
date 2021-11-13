from django.urls import path
from . import views

urlpatterns = [
    path('home/', views.index, name="home"),
    path('session/', views.sessions, name="session"),
    path('students/', views.students, name="students"),
    path('courses/', views.courses, name="courses"),
    path('addcourse/', views.addcourse, name="addcourse"),
    path('editcourse/<str:pk>/', views.editcourse, name="editcourse"),
    path('deletecourse/<str:pk>/', views.deletecourse, name="deletecourse")
]