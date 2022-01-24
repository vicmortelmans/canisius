<?xml version="1.0"?>
<xsl:stylesheet version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="dataroot">
    <books>
      <xsl:for-each-group select="Bible" group-by="Book_x0020_ID">
        <xsl:sort select="number(current-grouping-key())"/>
        <xsl:variable name="book" select="current-grouping-key()"/>
        <book id="{$book}">
          <xsl:for-each-group select="current-group()[Book_x0020_ID=$book]" group-by="Chapter">
            <xsl:sort select="number(current-grouping-key())"/>
            <xsl:variable name="chapter" select="current-grouping-key()"/>
            <chapter number="{$chapter}" number_of_verses="{count(current-group())}">
              <xsl:value-of select="current-group()[1]/Scripture"/>
            </chapter>
          </xsl:for-each-group>
        </book>
      </xsl:for-each-group>
    </books>
  </xsl:template>

</xsl:stylesheet>

