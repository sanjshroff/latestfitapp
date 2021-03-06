# Generated by Django 3.2.4 on 2021-11-19 20:57

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Course',
            fields=[
                ('courseid', models.AutoField(db_column='courseId', primary_key=True, serialize=False)),
                ('coursename', models.CharField(db_column='courseName', max_length=45)),
                ('coursedescription', models.CharField(blank=True, db_column='courseDescription', max_length=100, null=True)),
                ('featured_image', models.ImageField(blank=True, default='default.jpg', null=True, upload_to='')),
                ('zoom_link', models.CharField(blank=True, max_length=2000, null=True)),
                ('created', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'db_table': 'course',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Instructor',
            fields=[
                ('instructorid', models.AutoField(db_column='instructorId', primary_key=True, serialize=False)),
                ('instructorname', models.CharField(db_column='instructorName', max_length=45)),
                ('instructorcourse', models.CharField(blank=True, db_column='instructorCourse', max_length=45, null=True)),
                ('instructorskills', models.CharField(blank=True, db_column='instructorSkills', max_length=45, null=True)),
                ('instructorphonenumber', models.CharField(db_column='instructorPhoneNumber', max_length=45)),
                ('instructoremail', models.CharField(db_column='instructorEmail', max_length=45)),
                ('featured_image', models.ImageField(blank=True, default='default.jpg', null=True, upload_to='')),
                ('created', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'db_table': 'instructor',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Student',
            fields=[
                ('studentid', models.AutoField(db_column='studentId', primary_key=True, serialize=False)),
                ('studentfirstname', models.CharField(db_column='studentFirstName', max_length=45)),
                ('studentphonenumber', models.CharField(db_column='studentPhoneNumber', max_length=45)),
                ('studentlastname', models.CharField(blank=True, db_column='studentLastName', max_length=45, null=True)),
                ('studentemailid', models.EmailField(db_column='studentEmailId', max_length=45)),
                ('studentpassword', models.CharField(db_column='studentPassword', max_length=45)),
            ],
            options={
                'db_table': 'student',
                'managed': False,
            },
        ),
    ]
