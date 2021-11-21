from django.forms import ModelForm
from .models import Course, Instructor, Enroll

class CourseForm(ModelForm):
    class Meta:
        model = Course
        fields = '__all__'

class InstructorForm(ModelForm):
    class Meta:
        model = Instructor
        fields = '__all__'

class EnrollForm(ModelForm):
    class Meta:
        model = Enroll
        fields = '__all__'