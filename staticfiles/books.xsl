<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ex="https://mingjie-portfolio.vercel.app/books"
    xmlns:xhtml="http://www.w3.org/1999/xhtml">
    
    <xsl:template match="/">
        <!DOCTYPE>
        <html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
            <head>
                <title>Book Catalog</title>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            </head>
            <body>
                <h2>Book Catalog</h2>
                <table border="1">
                    <tr bgcolor="#9acd32">
                        <th>Author</th>
                        <th>Title</th>
                        <th>Genre</th>
                        <th>Price</th>
                        <th>Publish Date</th>
                        <th>Description</th>
                    </tr>
                    <xsl:for-each select="ex:catalog/ex:book">
                        <tr>
                            <td><xsl:value-of select="ex:author"/></td>
                            <td><xsl:value-of select="ex:title"/></td>
                            <td><xsl:value-of select="ex:genre"/></td>
                            <td><xsl:value-of select="ex:price"/></td>
                            <td><xsl:value-of select="ex:publish_date"/></td>
                            <td><xsl:value-of select="ex:description"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
