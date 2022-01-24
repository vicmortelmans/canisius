<?xml version="1.0"?>
<xsl:stylesheet version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>

  <xsl:variable name="books" select="document('https://raw.githubusercontent.com/vicmortelmans/BibleConfiguration/master/books.xml')/books"/>

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="dataroot">
    <xsl:for-each-group select="Bible" group-by="Book_x0020_ID">
      <xsl:sort select="number(current-grouping-key())"/>
      <xsl:variable name="book" select="current-grouping-key()"/>
      <xsl:for-each-group select="current-group()[Book_x0020_ID=$book]" group-by="Chapter">
        <xsl:sort select="number(current-grouping-key())"/>
        <xsl:variable name="chapter" select="current-grouping-key()"/>
        <xsl:variable name="book-name" select="$books/book[code[@service='can']=$book]/code[@service='osis']"/>
        <xsl:result-document method="xml" href="output-xml-per-chapter/{$book-name}-{$chapter}.xml">
          <bible translation="can" book="{$book-name}" chapter="{$chapter}">
            <xsl:for-each select="current-group()">
              <xsl:sort select="number(Verse)"/>
              <verse number="{Verse}">
                <xsl:value-of select="Scripture"/>
              </verse>
            </xsl:for-each>
          </bible>
        </xsl:result-document>
      </xsl:for-each-group>
    </xsl:for-each-group>
  </xsl:template>

</xsl:stylesheet>
