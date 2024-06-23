from django.shortcuts import render
from django.http import HttpResponse
import os
from django.shortcuts import redirect
from django.utils import translation
from django.conf import settings
from django.utils.translation import get_language
from django.utils.translation import gettext as _
import xml.etree.ElementTree as ET


def set_language(request):
    if request.method == 'POST':
        lang_code = request.POST.get('language')
        if lang_code and translation.check_for_language(lang_code):
            translation.activate(lang_code)
            response = redirect(request.POST.get('next', '/'))
            response.set_cookie(settings.LANGUAGE_COOKIE_NAME, lang_code)
            return response
    return redirect('/')


def translate_xml_element(element):
    # Recursively translate text nodes
    if element.text:
        element.text = _(element.text)
    for child in element:
        translate_xml_element(child)

import os
from django.http import HttpResponse
from lxml import etree

import os
from django.http import HttpResponse
from lxml import etree

def resume_view(request):
    xml_file_path = os.path.join('MyPortfolio', 'templates', 'resume', 'resume.xml')

    # Read XML content
    with open(xml_file_path, 'rb') as xml_file:
        xml_content = xml_file.read()

    # Parse the XML content
    parser = etree.XMLParser(remove_blank_text=True)
    root = etree.fromstring(xml_content, parser)

    # Get the language from the request (you might need to adjust this based on your setup)
    lang = request.LANGUAGE_CODE

    # Find the <lang> element and update its value
    lang_element = root.find('.//lang')
    if lang_element is not None:
        lang_element.text = lang
    if(lang == 'zh-hans'):
        lang_element.text = 'zh'

    # Convert the modified XML back to a string, including the XML declaration and stylesheet
    xml_declaration = '<?xml version="1.0" encoding="UTF-8"?>'
    xml_stylesheet = '<?xml-stylesheet type="text/xsl" href="/static/resume/resume.xsl"?>'
    dtd = """<!DOCTYPE resume SYSTEM "http://darksrv.netlib.re:3434/portfolio.dtd">"""
    
    xml_string = etree.tostring(root, pretty_print=True, encoding='UTF-8').decode('UTF-8')

    # Combine the declaration, stylesheet, and XML content
    full_xml_str = f"{xml_declaration}\n{xml_stylesheet}\n{dtd}\n{xml_string}"


    # Return the modified XML as the response
    return HttpResponse(full_xml_str, content_type='application/xml')


def books(request):
    xml_file_path = os.path.join('MyPortfolio', 'templates', 'books.xml')
    with open(xml_file_path, 'rb') as xml_file:
        xml_content = xml_file.read()
        
    return HttpResponse(xml_content, content_type='application/xml')

def home(request):
    context = {
        'LANGUAGE_CODE': get_language(),
    }
    print("context: ", context)
    return render(request, 'home.html', context)

def projects(request):
    return render(request, 'projects.html')

def contact(request):
    return render(request, 'contact.html')
