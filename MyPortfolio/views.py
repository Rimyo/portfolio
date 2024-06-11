from django.shortcuts import render
from django.http import HttpResponse
import lxml.etree as ET

def resume_view(request):
    xml_file = 'resume/resume.xml'
    xsl_file = 'resume/resume.xsl'

    xml_content = render(request, xml_file).content
    xsl_content = render(request, xsl_file).content

    xml_tree = ET.XML(xml_content)
    xsl_tree = ET.XML(xsl_content)

    transform = ET.XSLT(xsl_tree)
    result_tree = transform(xml_tree)

    return HttpResponse(result_tree, content_type='text/html')


def home(request):
    return render(request, 'home.html', {})
# Create your views here.
