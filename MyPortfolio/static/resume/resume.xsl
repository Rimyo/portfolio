<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
                indent="yes"/>
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="fr" xml:lang="fr">
            <head>
                <title>Resume of Mingjie Zhang</title>
                <link rel="stylesheet" type="text/css" href="/static/resume/resume.css"/>
                <script type="text/javascript">
                    <![CDATA[
                    function changeLanguage(lang) {
                        document.getElementById('language_input').value = lang;
                        document.getElementById('language_form').submit();
                    }

                    // Function to add CSRF token to the form
                    function addCsrfToken() {
                        var csrftoken = getCookie('csrftoken');
                        if (csrftoken) {
                            var input = document.createElement('input');
                            input.setAttribute('type', 'hidden');
                            input.setAttribute('name', 'csrfmiddlewaretoken');
                            input.setAttribute('value', csrftoken);
                            document.getElementById('language_form').appendChild(input);
                        }
                    }

                    // Function to get CSRF token from cookie
                    function getCookie(name) {
                        var cookieValue = null;
                        if (document.cookie && document.cookie !== '') {
                            var cookies = document.cookie.split(';');
                            for (var i = 0; i < cookies.length; i++) {
                                var cookie = cookies[i].trim();
                                // Does this cookie string begin with the name we want?
                                if (cookie.substring(0, name.length + 1) === (name + '=')) {
                                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                                    break;
                                }
                            }
                        }
                        return cookieValue;
                    }

                    // Add CSRF token when the document is ready
                    document.addEventListener('DOMContentLoaded', addCsrfToken);
                    ]]>
                </script>
            </head>
            <body>
                <div class="navbar">
                    <div>
                        <!-- Your website logo or name -->
                        <span>My Website</span>
                        <!-- Back to Home button -->
                        <a href="/" class="home-button">Back to Home</a>
                    </div>
                    <div>
                        <!-- Language selection flags -->
                        <form id="language_form" method="post" action="/i18n/setlang/">
                            <input type="hidden" name="next" value="/resume/" />
                            <input type="hidden" id="language_input" name="language" />
                            <img src="/static/flags/en.svg" class="flag" onclick="changeLanguage('en')" alt="English"/>
                            <img src="/static/flags/fr.svg" class="flag" onclick="changeLanguage('fr')" alt="Français"/>
                            <img src="/static/flags/cn.svg" class="flag" onclick="changeLanguage('zh-hans')" alt="中文"/>
                        </form>
                    </div>
                </div>
                <div class="resume-container">
                    <h1><xsl:value-of select="resume/personalInfo/name"/></h1>
                    <div class="contact-info">
                        <p>Adresse: <xsl:value-of select="resume/personalInfo/address"/></p>
                        <p>Email: <xsl:value-of select="resume/personalInfo/email"/></p>
                        <p>Âge: <xsl:value-of select="resume/personalInfo/age"/></p>
                    </div>
                    <div class="section objective">
                        <h2><xsl:value-of select="resume/objective/@translatedTitle"/></h2>
                        <p><xsl:value-of select="resume/objective"/></p>
                    </div>
                    <div class="section education">
                        <h2><xsl:value-of select="resume/education/@translatedTitle"/></h2>
                        <ul>
                            <xsl:for-each select="resume/education/course">
                                <li><xsl:value-of select="years"/>: <xsl:value-of select="degree"/> - <xsl:value-of select="institution"/></li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    <div class="section skills">
                        <h2><xsl:value-of select="resume/skills/@translatedTitle"/></h2>
                        <ul>
                            <xsl:for-each select="resume/skills/skill">
                                <li><xsl:value-of select="category"/>
                                    <ul>
                                        <xsl:for-each select="details/detail">
                                            <li><xsl:value-of select="."/></li>
                                        </xsl:for-each>
                                    </ul>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    <div class="section experience">
                        <h2><xsl:value-of select="resume/experience/@translatedTitle"/></h2>
                        <ul>
                            <xsl:for-each select="resume/experience/job">
                                <li>
                                    <xsl:value-of select="years"/>: <xsl:value-of select="position"/> - <xsl:value-of select="location"/>
                                    <ul>
                                        <xsl:for-each select="tasks/task">
                                            <li><xsl:value-of select="."/></li>
                                        </xsl:for-each>
                                    </ul>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    <div class="section projects">
                        <h2><xsl:value-of select="resume/projects/@translatedTitle"/></h2>
                        <h3><xsl:value-of select="resume/projects/schoolProjects/@translatedTitle"/></h3>
                        <ul>
                            <xsl:for-each select="resume/projects/schoolProjects/project">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                        <h3><xsl:value-of select="resume/projects/personalProjects/@translatedTitle"/></h3>
                        <ul>
                            <xsl:for-each select="resume/projects/personalProjects/project">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    <div class="section">
                        <h2>LinkedIn</h2>
                        <p><a href="{resume/personalInfo/linkedin}"><xsl:value-of select="resume/personalInfo/linkedin"/></a></p>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
