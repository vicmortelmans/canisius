<?xml version="1.0"?>
<xsl:stylesheet version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>

  <xsl:variable name="books" select="document('BibleConfiguration/books.xml')/books"/>
  <xsl:variable name="dom" select="'https://bijbel.gelovenleren.net'"/>
  
  <xsl:template match="/">
    <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xhtml="http://www.w3.org/1999/xhtml">
      <url><loc><xsl:value-of select="$dom"/>/index.html</loc></url>
      <xsl:for-each-group select="dataroot/Bible" group-by="Book_x0020_ID">
        <xsl:sort select="number(Book_x0020_ID)"/>
        <xsl:variable name="book" select="$books/book[code[@service='can']=current-grouping-key()]/input[contains(@language,'nl')]"/>
        <url><loc><xsl:value-of select="$dom"/>/<xsl:value-of select="$book"/>.html</loc></url>
      </xsl:for-each-group>
    </urlset>
  </xsl:template>

</xsl:stylesheet>


