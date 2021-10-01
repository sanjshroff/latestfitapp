from django.http import HttpResponse

def index(request):
    return HttpResponse("<h1>Welcome to Fitness World</h1>")

def sessions(request):
    return HttpResponse("<h1>Sessions available today are:</h1>")