from django.shortcuts import render
from django.http import HttpResponse
import lxml.etree as ET
import os


def resume_view(request):
    xml_file_path = os.path.join('MyPortfolio', 'static', 'resume', 'resume.xml')

    # Read XML content
    with open(xml_file_path, 'rb') as xml_file:
        xml_content = xml_file.read()

    # Return the XML content as a response
    return HttpResponse(xml_content, content_type='application/xml')


def home(request):
    return render(request, 'home.html', {})
# Create your views here.
