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

def resume_view(request):
    xml_file_path = os.path.join('MyPortfolio', 'templates', 'resume', 'resume.xml')

    # Read XML content
    with open(xml_file_path, 'rb') as xml_file:
        xml_content = xml_file.read()

    # Parse the XML content
    root = ET.fromstring(xml_content)

    # Translate the text nodes
    translate_xml_element(root)

    # Translate specific section headings
    for section in root.findall(".//objective"):
        section.set('translatedTitle', _('Objectif'))
    print()

    for section in root.findall(".//education"):
        section.set('translatedTitle', _('Éducation'))
        
    for section in root.findall(".//skills"):
        section.set('translatedTitle', _('Compétences'))

    for section in root.findall(".//experience"):
        section.set('translatedTitle', _('Expériences Professionnelles'))
        
    for section in root.findall(".//projects"):
        section.set('translatedTitle', _('Projets'))
        for sub_section in section.findall(".//schoolProjects"):
            sub_section.set('translatedTitle', _('Projets scolaires'))
        for sub_section in section.findall(".//personalProjects"):
            sub_section.set('translatedTitle', _('Projets personnels'))

    for section in root.findall(".//personalInfo"):
        for sub_section in section.findall(".//name"):
            sub_section.set('translatedTitle', _('Nom'))

    # Convert the XML tree to a string without the XML declaration
    xml_str = ET.tostring(root, encoding='unicode', method='xml')

    # Add the original XML declaration and stylesheet declaration manually
    xml_declaration = '<?xml version="1.0" encoding="UTF-8"?>\n'
    xml_stylesheet = '<?xml-stylesheet type="text/xsl" href="/static/resume/resume.xsl"?>\n'
    full_xml_str = f"{xml_declaration}{xml_stylesheet}{xml_str}"

    # Return the XML content as a response
    return HttpResponse(full_xml_str, content_type='application/xml')

def home(request):
    context = {
        'LANGUAGE_CODE': get_language(),
    }
    print("context: ", context)
    return render(request, 'home.html', context)
# Create your views here.
