from django.db.models import Q
from fitnessadmin.models import Instructor

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