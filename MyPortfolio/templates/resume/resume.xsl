<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Resume of Mingjie Zhang</title>
                <style>
                    body { font-family: Arial, sans-serif; line-height: 1.6; }
                    .section { margin-bottom: 20px; }
                    .section h2 { background: #f4f4f4; padding: 10px; }
                    .section ul { list-style: none; padding: 0; }
                    .section ul li { margin: 5px 0; }
                    .personalInfo p, .objective p { margin: 5px 0; }
                </style>
            </head>
            <body>
                <div class="section personalInfo">
                    <h2>Informations Personnelles</h2>
                    <p><strong>Nom:</strong> <xsl:value-of select="resume/personalInfo/name"/></p>
                    <p><strong>Age:</strong> <xsl:value-of select="resume/personalInfo/age"/></p>
                    <p><strong>Téléphone:</strong> <xsl:value-of select="resume/personalInfo/phone"/></p>
                    <p><strong>Adresse:</strong> <xsl:value-of select="resume/personalInfo/address"/></p>
                    <p><strong>Email:</strong> <xsl:value-of select="resume/personalInfo/email"/></p>
                    <p><strong>LinkedIn:</strong> <a href="{resume/personalInfo/linkedin}"><xsl:value-of select="resume/personalInfo/linkedin"/></a></p>
                    <p><strong>GitHub:</strong> <a href="{resume/personalInfo/github}"><xsl:value-of select="resume/personalInfo/github"/></a></p>
                </div>
                <div class="section objective">
                    <h2>Objectif</h2>
                    <p><xsl:value-of select="resume/objective"/></p>
                </div>
                <div class="section education">
                    <h2>Formations</h2>
                    <ul>
                        <xsl:for-each select="resume/education/course">
                            <li><strong><xsl:value-of select="years"/>:</strong> <xsl:value-of select="degree"/> - <xsl:value-of select="institution"/></li>
                        </xsl:for-each>
                    </ul>
                </div>
                <div class="section experience">
                    <h2>Expériences Professionnelles</h2>
                    <ul>
                        <xsl:for-each select="resume/experience/job">
                            <li>
                                <strong><xsl:value-of select="years"/>:</strong> <xsl:value-of select="position"/> - <xsl:value-of select="location"/>
                                <ul>
                                    <xsl:for-each select="tasks/task">
                                        <li><xsl:value-of select="."/></li>
                                    </xsl:for-each>
                                </ul>
                            </li>
                        </xsl:for-each>
                    </ul>
                </div>
                <div class="section skills">
                    <h2>Compétences</h2>
                    <ul>
                        <xsl:for-each select="resume/skills/skill">
                            <li><strong><xsl:value-of select="category"/>:</strong>
                                <ul>
                                    <xsl:for-each select="details/detail">
                                        <li><xsl:value-of select="."/></li>
                                    </xsl:for-each>
                                </ul>
                            </li>
                        </xsl:for-each>
                    </ul>
                </div>
                <div class="section projects">
                    <h2>Projets Informatiques</h2>
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
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
