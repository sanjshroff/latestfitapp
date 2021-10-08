from django.shortcuts import render

# Create your views here.
from django.http import HttpResponse
import MySQLdb


def index(request):
    db = MySQLdb.connect("localhost", "root", "admin123", "fitnessdb")
    cursor = db.cursor()
    query = """select * from instructor;"""
    cursor.execute(query)
    results = cursor.fetchall()
    for r in results:
        print(r)
    cursor.close()
    db.close()
    return HttpResponse("<h1>Welcome to Fitness World!</h1>")

def sessions(request):
    return HttpResponse("<h1>Sessions available today are:</h1>")