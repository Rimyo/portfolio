<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" 
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
                indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Resume of Mingjie Zhang</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        line-height: 1.6;
                        background-color: #f4f4f4;
                        margin: 0;
                        padding: 0;
                    }
                    .navbar {
                        background-color: #333;
                        color: white;
                        padding: 10px;
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        width: 100%;
                        box-sizing: border-box;
                        position: fixed;
                        top: 0;
                        left: 0;
                        z-index: 1000;
                    }
                    .navbar select {
                        font-size: 16px;
                        padding: 5px;
                        cursor: pointer;
                        background-color: #555;
                        color: white;
                        border: none;
                    }
                    .navbar select:hover {
                        background-color: #777;
                    }
                    .resume-container {
                        background-color: white;
                        width: 800px;
                        padding: 20px;
                        margin: 60px auto 20px; /* Adjusted margin to account for the fixed navbar */
                        box-shadow: 0 0 10px rgba(0,0,0,0.1);
                    }
                    h1, h2, h3 {
                        background: #333;
                        color: white;
                        padding: 10px;
                        margin: 0 -20px 20px;
                    }
                    .section {
                        margin-bottom: 20px;
                    }
                    .section ul {
                        list-style: none;
                        padding: 0;
                    }
                    .section ul li {
                        margin: 5px 0;
                    }
                    .personalInfo p, .objective p {
                        margin: 5px 0;
                    }
                    .contact-info {
                        display: flex;
                        justify-content: space-between;
                        margin-bottom: 20px;
                    }
                    .contact-info p {
                        margin: 0;
                    }
                    .skills ul, .experience ul {
                        margin-left: 20px;
                    }
                    .experience ul ul {
                        margin-left: 20px;
                    }
                </style>
                <script type="text/javascript">
                    function changeLanguage() {
                        document.getElementById('language_form').submit();
                    }
                </script>
            </head>
            <body>
                <div class="navbar">
                    <div>
                        <!-- Your website logo or name -->
                        <span>My Website</span>
                    </div>
                    <div>
                        <!-- Language selection buttons -->
                        <form id="language_form" method="post" action="/set_language">
                            <select name="language" onchange="changeLanguage()">
                                <option value="en">English</option>
                                <option value="fr">Français</option>
                                <option value="cn">中文</option>
                                <!-- Add more languages as needed -->
                            </select>
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
                        <h2>Objectif</h2>
                        <p><xsl:value-of select="resume/objective"/></p>
                    </div>
                    <div class="section education">
                        <h2>Éducation</h2>
                        <ul>
                            <xsl:for-each select="resume/education/course">
                                <li><xsl:value-of select="years"/>: <xsl:value-of select="degree"/> - <xsl:value-of select="institution"/></li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    <div class="section skills">
                        <h2>Compétences</h2>
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
                        <h2>Expériences Professionnelles</h2>
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
                        <h2>Projets</h2>
                        <h3>Projets scolaires</h3>
                        <ul>
                            <xsl:for-each select="resume/projects/schoolProjects/project">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ul>
                        <h3>Projets personnels</h3>
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
