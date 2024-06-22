<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:param name="lang" select="resume/page/lang"/>

    <xsl:template match="/">
        <html lang="{resume/page/lang}" xml:lang="{resume/page/lang}">
            <head>
                <title>
                    <xsl:value-of select="resume/page/title/*[local-name()=$lang]"/>
                </title>
                <link rel="stylesheet" type="text/css" href="/static/resume/resume.css"/>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
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
                        <div>
                            <a href="/" class="styled-link">
                                <span id="name">
                                    <xsl:choose>
                                        <xsl:when test="$lang='en'">Mingjie Zhang</xsl:when>
                                        <xsl:when test="$lang='fr'">Mingjie Zhang</xsl:when>
                                        <xsl:when test="$lang='zh'">张明杰</xsl:when>
                                    </xsl:choose>
                                </span>
                                <span id="title">
                                    <xsl:choose>
                                        <xsl:when test="$lang='en'">/ Computer engineering apprentice</xsl:when>
                                        <xsl:when test="$lang='fr'">/ Apprenti Ingénieur Informatique</xsl:when>
                                        <xsl:when test="$lang='zh'">/ 计算机工程学徒</xsl:when>
                                    </xsl:choose>
                                </span>
                            </a>
                        </div>            
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
                <div class="download-button-container">
                    <button class="download-button" onclick="window.location.href='/static/resume/resume_Mingjie_Zhang.pdf'">
                        <xsl:choose>
                            <xsl:when test="$lang='en'">Download PDF</xsl:when>
                            <xsl:when test="$lang='fr'">Télécharger PDF</xsl:when>
                            <xsl:when test="$lang='zh'">下载PDF</xsl:when>
                        </xsl:choose>
                    </button>
                </div>
                <div class="sidebar">
                    <a href="/" class="sidebar-link">Accueil</a>
                    <a href="/resume/" class="sidebar-link active">
                        <xsl:choose>
                            <xsl:when test="$lang='en'">Resume</xsl:when>
                            <xsl:when test="$lang='fr'">CV</xsl:when>
                            <xsl:when test="$lang='zh'">简历</xsl:when>
                        </xsl:choose>
                    </a>
                    <a href="/projects/" class="sidebar-link">
                        <xsl:choose>
                            <xsl:when test="$lang='en'">Projects</xsl:when>
                            <xsl:when test="$lang='fr'">Projets</xsl:when>
                            <xsl:when test="$lang='zh'">项目</xsl:when>
                        </xsl:choose>
                    </a>
                    <a href="/contact/" class="sidebar-link">
                        <xsl:choose>
                            <xsl:when test="$lang='en'">Contact</xsl:when>
                            <xsl:when test="$lang='fr'">Contact</xsl:when>
                            <xsl:when test="$lang='zh'">联系</xsl:when>
                        </xsl:choose>
                    </a>
                </div>
                <div class="content">
                    <div class="content resume-container">
                        <div class="header">
                            <h1><xsl:value-of select="resume/personalInfo/name/*[local-name()=$lang]"/></h1>
                            <div class="contact-info">
                                <p><xsl:value-of select="resume/personalInfo/phone"/></p>
                                <p><xsl:value-of select="resume/personalInfo/email"/></p>
                                <p><xsl:value-of select="resume/personalInfo/birthdate"/></p>
                                <p><a href="{resume/personalInfo/linkedin}"><xsl:value-of select="resume/personalInfo/linkedin"/></a></p>
                                <p><a href="{resume/personalInfo/github}"><xsl:value-of select="resume/personalInfo/github"/></a></p>
                            </div>
                        </div>
                        <div class="section title">
                            <h2>
                                <xsl:choose>
                                    <xsl:when test="$lang='en'">Apprentice Computer Engineer</xsl:when>
                                    <xsl:when test="$lang='fr'">Apprenti Ingénieur Informatique</xsl:when>
                                    <xsl:when test="$lang='zh'">计算机工程学徒</xsl:when>
                                </xsl:choose>
                            </h2>
                        </div>
                        <div class="section presentation">
                            <h2>
                                <xsl:choose>
                                    <xsl:when test="$lang='en'">About Me</xsl:when>
                                    <xsl:when test="$lang='fr'">À propos de moi</xsl:when>
                                    <xsl:when test="$lang='zh'">关于我</xsl:when>
                                </xsl:choose>
                            </h2>
                            <p><xsl:value-of select="resume/presentation/*[local-name()=$lang]"/></p>
                        </div>
                        <div class="section education">
                            <h2>
                                <xsl:choose>
                                    <xsl:when test="$lang='en'">Education</xsl:when>
                                    <xsl:when test="$lang='fr'">Formation</xsl:when>
                                    <xsl:when test="$lang='zh'">教育</xsl:when>
                                </xsl:choose>
                            </h2>
                            <ul>
                                <xsl:for-each select="resume/education/course">
                                    <li>
                                        <xsl:value-of select="degree/*[local-name()=$lang]"/> - <xsl:value-of select="institution/*[local-name()=$lang]"/>, 
                                        <span><xsl:value-of select="years/*[local-name()=$lang]"/></span>
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
                                        <xsl:value-of select="position/*[local-name()=$lang]"/> - <xsl:value-of select="location/*[local-name()=$lang]"/>
                                        <span><xsl:value-of select="years/*[local-name()=$lang]"/></span>
                                        <ul>
                                            <xsl:for-each select="tasks/task">
                                                <li><xsl:value-of select="*[local-name()=$lang]"/></li>
                                            </xsl:for-each>
                                        </ul>
                                    </li>
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
                        <div class="section projects">
                            <h2>
                                <xsl:choose>
                                    <xsl:when test="$lang='en'">Projects</xsl:when>
                                    <xsl:when test="$lang='fr'">Projets</xsl:when>
                                    <xsl:when test="$lang='zh'">项目</xsl:when>
                                </xsl:choose>
                            </h2>
                            <ul>
                                <xsl:for-each select="resume/projects/project">
                                    <li><xsl:value-of select="*[local-name()=$lang]"/></li>
                                </xsl:for-each>
                            </ul>
                        </div>
                        <div class="section languages">
                            <h2>
                                <xsl:choose>
                                    <xsl:when test="$lang='en'">Languages</xsl:when>
                                    <xsl:when test="$lang='fr'">Langues</xsl:when>
                                    <xsl:when test="$lang='zh'">语言</xsl:when>
                                </xsl:choose>
                            </h2>
                            <ul>
                                <xsl:for-each select="resume/languages/language">
                                    <li>
                                        <xsl:value-of select="name/*[local-name()=$lang]"/> - <xsl:value-of select="level/*[local-name()=$lang]"/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </div>
                        <div class="section interets">
                            <h2>
                                <xsl:choose>
                                    <xsl:when test="$lang='en'">Interests</xsl:when>
                                    <xsl:when test="$lang='fr'">Intérêts</xsl:when>
                                    <xsl:when test="$lang='zh'">兴趣</xsl:when>
                                </xsl:choose>
                            </h2>
                            <ul>
                                <xsl:for-each select="resume/interets/interest">
                                    <li><xsl:value-of select="*[local-name()=$lang]"/></li>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </div>
                    <div class="footer">
                        <div class="footer-content">
                            <div class="column">
                                <h4>
                                    <xsl:choose>
                                        <xsl:when test="$lang='en'">Phone</xsl:when>
                                        <xsl:when test="$lang='fr'">Tel</xsl:when>
                                        <xsl:when test="$lang='zh'">电话</xsl:when>
                                    </xsl:choose>
                                </h4>
                                <p>06 05 72 57 82</p>
                            </div>
                            <div class="column">
                                <h4>
                                    <xsl:choose>
                                        <xsl:when test="$lang='en'">Email</xsl:when>
                                        <xsl:when test="$lang='fr'">Courriel</xsl:when>
                                        <xsl:when test="$lang='zh'">电子邮件</xsl:when>
                                    </xsl:choose>
                                </h4>
                                <p><a href="mailto:mingjie.zhang.pro@gmail.com">mingjie.zhang.pro@gmail.com</a></p>
                            </div>
                            <div class="column">
                                <h4>
                                    <xsl:choose>
                                        <xsl:when test="$lang='en'">Online</xsl:when>
                                        <xsl:when test="$lang='fr'">En ligne</xsl:when>
                                        <xsl:when test="$lang='zh'">网上</xsl:when>
                                    </xsl:choose>
                                </h4>
                                <div class="Online-links">
                                    <a href="https://github.com/Rimyo"><i class="fab fa-github"></i></a>
                                    <a href="https://www.linkedin.com/in/mingjie-zhang-300ab9267/"><i class="fab fa-linkedin-in"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
