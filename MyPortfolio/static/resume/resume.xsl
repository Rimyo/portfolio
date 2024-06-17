<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" indent="yes"/>
    <xsl:param name="lang" select="resume/page/lang"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="{resume/page/lang}" xml:lang="{resume/page/lang}">
        <head>
            <title>
                <xsl:value-of select="resume/page/title/*[local-name()=$lang]"/>
            </title>
            <link rel="stylesheet" type="text/css" href="/static/resume/resume.css"/>
            <script type="text/javascript">
                <![CDATA[
                function changeLanguage(lang) {
                    document.getElementById('language_input').value = lang;
                    document.getElementById('language_form').submit();
                }

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

                function getCookie(name) {
                    var cookieValue = null;
                    if (document.cookie && document.cookie !== '') {
                        var cookies = document.cookie.split(';');
                        for (var i = 0; i < cookies.length; i++) {
                            var cookie = cookies[i].trim();
                            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                                break;
                            }
                        }
                    }
                    return cookieValue;
                }

                document.addEventListener('DOMContentLoaded', addCsrfToken);
                ]]>
            </script>
        </head>
        <body>
            <div class="navbar">
                <div>
                    <span>My Website</span>
                    <a href="/" class="home-button">Back to Home</a>
                </div>
                <div>
                    <form id="language_form" method="post" action="/i18n/setlang/">
                        <input type="hidden" name="next" value="/resume/"/>
                        <input type="hidden" id="language_input" name="language"/>
                        <img src="/static/flags/en.svg" class="flag" onclick="changeLanguage('en')" alt="English"/>
                        <img src="/static/flags/fr.svg" class="flag" onclick="changeLanguage('fr')" alt="Français"/>
                        <img src="/static/flags/zh.svg" class="flag" onclick="changeLanguage('zh-hans')" alt="中文"/>
                    </form>
                </div>
            </div>
            <div class="resume-container">
                <h1><xsl:value-of select="resume/personalInfo/name/*[local-name()=$lang]"/></h1>
                <div class="contact-info">
                    <p>
                        <xsl:choose>
                            <xsl:when test="$lang='en'">Address:</xsl:when>
                            <xsl:when test="$lang='fr'">Adresse:</xsl:when>
                            <xsl:when test="$lang='zh'">地址:</xsl:when>
                        </xsl:choose>
                        <xsl:value-of select="resume/personalInfo/address/*[local-name()=$lang]"/>
                    </p>
                    <p>
                        <xsl:choose>
                            <xsl:when test="$lang='en'">Email:</xsl:when>
                            <xsl:when test="$lang='fr'">Email:</xsl:when>
                            <xsl:when test="$lang='zh'">电子邮件:</xsl:when>
                        </xsl:choose>
                        <xsl:value-of select="resume/personalInfo/email"/>
                    </p>
                    <p>
                        <xsl:choose>
                            <xsl:when test="$lang='en'">Age:</xsl:when>
                            <xsl:when test="$lang='fr'">Âge:</xsl:when>
                            <xsl:when test="$lang='zh'">年龄:</xsl:when>
                        </xsl:choose>
                        <xsl:value-of select="resume/personalInfo/age"/>
                    </p>
                </div>
                <div class="section network">
                    <h2>
                        <xsl:choose>
                            <xsl:when test="$lang='en'">LinkedIn</xsl:when>
                            <xsl:when test="$lang='fr'">LinkedIn</xsl:when>
                            <xsl:when test="$lang='zh'">领英</xsl:when>
                        </xsl:choose>
                    </h2>
                    <p><a href="{resume/personalInfo/linkedin}"><xsl:value-of select="resume/personalInfo/linkedin"/></a></p>
                    <h2>GitHub</h2>
                    <p><a href="{resume/personalInfo/github}"><xsl:value-of select="resume/personalInfo/github"/></a></p>
                </div>
                <div class="section presentation">
                    <h2>
                        <xsl:choose>
                            <xsl:when test="$lang='en'">Presentation</xsl:when>
                            <xsl:when test="$lang='fr'">Présentation</xsl:when>
                            <xsl:when test="$lang='zh'">介绍</xsl:when>
                        </xsl:choose>
                    </h2>
                    <p><xsl:value-of select="resume/presentation/*[local-name()=$lang]"/></p>
                </div>
                <div class="section education">
                    <h2>
                        <xsl:choose>
                            <xsl:when test="$lang='en'">Education</xsl:when>
                            <xsl:when test="$lang='fr'">Éducation</xsl:when>
                            <xsl:when test="$lang='zh'">教育</xsl:when>
                        </xsl:choose>
                    </h2>
                    <ul>
                        <xsl:for-each select="resume/education/course">
                            <li><xsl:value-of select="years/*[local-name()=$lang]"/>: <xsl:value-of select="degree/*[local-name()=$lang]"/> - <xsl:value-of select="institution/*[local-name()=$lang]"/></li>
                        </xsl:for-each>
                    </ul>
                </div>
                <div class="section skills">
                    <h2>
                        <xsl:choose>
                            <xsl:when test="$lang='en'">Skills</xsl:when>
                            <xsl:when test="$lang='fr'">Compétences</xsl:when>
                            <xsl:when test="$lang='zh'">技能</xsl:when>
                        </xsl:choose>
                    </h2>
                    <ul>
                        <xsl:for-each select="resume/skills/skill">
                            <li><xsl:value-of select="category/*[local-name()=$lang]"/>
                                <ul>
                                    <xsl:for-each select="details/detail">
                                        <li><xsl:value-of select="*[local-name()=$lang]"/></li>
                                    </xsl:for-each>
                                </ul>
                            </li>
                        </xsl:for-each>
                    </ul>
                </div>
                <div class="section experience">
                    <h2>
                        <xsl:choose>
                            <xsl:when test="$lang='en'">Experience</xsl:when>
                            <xsl:when test="$lang='fr'">Expérience</xsl:when>
                            <xsl:when test="$lang='zh'">经验</xsl:when>
                        </xsl:choose>
                    </h2>
                    <ul>
                        <xsl:for-each select="resume/experience/job">
                            <li>
                                <xsl:value-of select="years/*[local-name()=$lang]"/>: <xsl:value-of select="position/*[local-name()=$lang]"/> - <xsl:value-of select="location/*[local-name()=$lang]"/>
                                <ul>
                                    <xsl:for-each select="tasks/task">
                                        <li><xsl:value-of select="*[local-name()=$lang]"/></li>
                                    </xsl:for-each>
                                </ul>
                            </li>
                        </xsl:for-each>
                    </ul>
                </div>
                <div class="section projects">
                    <h2>
                        <xsl:choose>
                            <xsl:when test="$lang='en'">Projects</xsl:when>
                            <xsl:when test="$lang='fr'">Projets</xsl:when>
                            <xsl:when test="$lang='zh'">项目</xsl:when>
                        </xsl:choose>
                    </h2>
                    <h3>
                        <xsl:choose>
                            <xsl:when test="$lang='en'">School Projects</xsl:when>
                            <xsl:when test="$lang='fr'">Projets Scolaires</xsl:when>
                            <xsl:when test="$lang='zh'">学校项目</xsl:when>
                        </xsl:choose>
                    </h3>
                    <ul>
                        <xsl:for-each select="resume/projects/schoolProjects/project">
                            <li><xsl:value-of select="*[local-name()=$lang]"/></li>
                        </xsl:for-each>
                    </ul>
                    <h3>
                        <xsl:choose>
                            <xsl:when test="$lang='en'">Personal Projects</xsl:when>
                            <xsl:when test="$lang='fr'">Projets Personnels</xsl:when>
                            <xsl:when test="$lang='zh'">个人项目</xsl:when>
                        </xsl:choose>
                    </h3>
                    <ul>
                        <xsl:for-each select="resume/projects/personalProjects/project">
                            <li><xsl:value-of select="*[local-name()=$lang]"/></li>
                        </xsl:for-each>
                    </ul>
                </div>
            </div>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
