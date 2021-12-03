from django.urls import path
from . import views

urlpatterns = [

    path('instructorslogin/', views.instructorloginUser, name="admininstructorslogin"),

    path('viewallInstructors/', views.viewallInstructors, name="viewallInstructors"),
    # path('instructor/<str:pk>', views.instructor, name="instructor"),
    path('courses/', views.courses, name="instructorscourses"),

    path('course/<str:pk>', views.course, name="instructorcourse"),

    path('instructordetailsbyid/<str:pk>', views.instructorbyId, name="instructordetailsbyid"),
    # path('instructorcourses/', views.instructorcourses, name="instructorcourses"),
    # path('instructorcoursebyId/<str:pk>', views.instructorcoursebyId, name="instructorcoursebyId"),




  
]