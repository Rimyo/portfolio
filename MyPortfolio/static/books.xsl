<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" 
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
            <head>
                <title>Book Catalog</title>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            </head>
            <body>
                <h1>Book Catalog</h1>
                <xsl:apply-templates select="catalog/book"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="book">
        <div class="book">
            <h2><xsl:value-of select="title"/></h2>
            <p><strong>Author:</strong> <xsl:value-of select="author"/></p>
            <p><strong>Genre:</strong> <xsl:value-of select="genre"/></p>
            <p><strong>Price:</strong> $<xsl:value-of select="price"/></p>
            <p><strong>Publish Date:</strong> <xsl:value-of select="publish_date"/></p>
            <p><strong>Description:</strong> <xsl:value-of select="description"/></p>
        </div>
    </xsl:template>
</xsl:stylesheet>
