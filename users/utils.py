from django.db.models import Q
from fitnessadmin.models import Course, Instructor

def searchInstructors(request):
    search_query = ""
    if request.GET.get('search_query'):
        search_query = request.GET.get('search_query')
        instructors = Instructor.objects.distinct().filter(
        Q(instructorname__icontains=search_query) |
        Q(instructorcourse__icontains=search_query) |
        Q(instructorskills__icontains=search_query)
    )
    else:
        instructors = Instructor.objects.all()

    return instructors, search_query

def searchCourses(request):
    search_query = ""

    #instructors = Instructor.objects.distinct().filter(Q(instructorname__icontains=search_query))
    #print("display:", instructors)
    if request.GET.get('search_query'):
        search_query = request.GET.get('search_query')
        courses = Course.objects.distinct().filter(
        Q(coursename__icontains=search_query) |
        Q(coursedescription__icontains=search_query)
        #Q(trainer__in=instructors)
        )
        print("Searched course:", courses)

    else:
        courses = Course.objects.all()

    return courses, search_query