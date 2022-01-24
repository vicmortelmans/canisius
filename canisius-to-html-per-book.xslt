<?xml version="1.0"?>
<xsl:stylesheet version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes"/>

  <xsl:param name="dir" select="."/>

  <xsl:variable name="books" select="document('BibleConfiguration/books.xml')/books"/>
  
  <xsl:template match="/">
    <xsl:result-document href="{$dir}/index.html" method="html">
      <html>
        <head>
          <title>De Bijbel - Petrus Canisiusvertaling</title>
          <style>
            p.chapter {
              border: solid 1pt #ccc;
              background-color: #eee;
              padding: 8pt;
            }
            div {
              text-align: center;
            }
            .title {
              font-size: 28pt;
              font-weight: bold;
            }
            sup {
              color: #900;
              font-weight: bold;
            }
            .page {
              page-break-before: always;
            }
          </style>
        </head>
        <body>
          <div>
            <p class="title">De Bijbel<br/>Vertaling Petrus Canisius</p>
            <p>De Heilige Schrift, vertaling uit de grondtekst in opdracht van de Apologetische Vereniging 'Petrus Canisius' ondernomen met goedkeuring van de hoogwaardige bisschoppen van Nederland</p>
            <p>Oorspronkelijke uitgave 1939</p>
            <p><a href="http://www.gelovenleren.net">gelovenleren.net</a></p>
          </div>
          <!-- TOC with list of books -->
          <p id="inhoud" class="page"><b>Oude Testament</b></p>
          <p>
            <xsl:for-each-group select="dataroot/Bible[number(Book_x0020_ID) &lt; 40]" group-by="Book_x0020_ID">
              <xsl:sort select="number(Book_x0020_ID)"/>
              <xsl:variable name="book" select="$books/book[code[@service='can']=current-grouping-key()]/input[contains(@language,'nl')]"/>
              <xsl:variable name="book-long" select="$books/book[code[@service='can']=current-grouping-key()]/input[1]"/>
              <a href="{$book}.html">
                <xsl:text>[</xsl:text>
                <xsl:value-of select="$book-long"/>
                <xsl:text>]</xsl:text>
              </a>
              <xsl:text> </xsl:text>
            </xsl:for-each-group>
          </p>
          <p><b>Deuterocanonieke Boeken</b></p>
          <p>
            <xsl:for-each-group select="dataroot/Bible[number(Book_x0020_ID) &gt; 66]" group-by="Book_x0020_ID">
              <xsl:sort select="number(Book_x0020_ID)"/>
              <xsl:variable name="book" select="$books/book[code[@service='can']=current-grouping-key()]/input[contains(@language,'nl')]"/>
              <xsl:variable name="book-long" select="$books/book[code[@service='can']=current-grouping-key()]/input[1]"/>
              <a href="{$book}.html">
                <xsl:text>[</xsl:text>
                <xsl:value-of select="$book-long"/>
                <xsl:text>]</xsl:text>
              </a>
              <xsl:text> </xsl:text>
            </xsl:for-each-group>
          </p>
          <p><b>Nieuwe Testament</b></p>
          <p>
            <xsl:for-each-group select="dataroot/Bible[number(Book_x0020_ID) &gt; 39 and number(Book_x0020_ID) &lt; 67]" group-by="Book_x0020_ID">
              <xsl:sort select="number(Book_x0020_ID)"/>
              <xsl:variable name="book" select="$books/book[code[@service='can']=current-grouping-key()]/input[contains(@language,'nl')]"/>
              <xsl:variable name="book-long" select="$books/book[code[@service='can']=current-grouping-key()]/input[1]"/>
              <a href="{$book}.html">
                <xsl:text>[</xsl:text>
                <xsl:value-of select="$book-long"/>
                <xsl:text>]</xsl:text>
              </a>
              <xsl:text> </xsl:text>
            </xsl:for-each-group>
          </p>
          <div><p><a href="canisius.html">De hele Bijbel op één webpagina</a></p></div>
        </body>
      </html>
    </xsl:result-document>
    <!-- Books -->
    <xsl:for-each-group select="dataroot/Bible" group-by="Book_x0020_ID">
      <xsl:sort select="number(Book_x0020_ID)"/>
      <xsl:variable name="book" select="$books/book[code[@service='can']=current-grouping-key()]/input[contains(@language,'nl')]"/>
      <xsl:variable name="book-long" select="$books/book[code[@service='can']=current-grouping-key()]/input[1]"/>
      <xsl:result-document href="{$dir}/{$book}.html" method="html">
        <html>
          <head>
            <title>De Bijbel - Petrus Canisiusvertaling</title>
            <style>
              p.chapter {
                border: solid 1pt #ccc;
                background-color: #eee;
                padding: 8pt;
              }
              div {
                text-align: center;
              }
              .title {
                font-size: 28pt;
                font-weight: bold;
              }
              sup {
                color: #900;
                font-weight: bold;
              }
              .page {
                page-break-before: always;
              }
            </style>
          </head>
          <body>
            <div>
              <p class="title">De Bijbel<br/>Vertaling Petrus Canisius</p>
              <p>De Heilige Schrift, vertaling uit de grondtekst in opdracht van de Apologetische Vereniging 'Petrus Canisius' ondernomen met goedkeuring van de hoogwaardige bisschoppen van Nederland</p>
              <p>Oorspronkelijke uitgave 1939</p>
              <p><a href="http://www.gelovenleren.net">gelovenleren.net</a></p>
            </div>
            <!-- Book title -->
            <h1 id="{$book}" class="page">
              <xsl:value-of select="$book-long"/>
            </h1>
            <!-- TOC with list of chapters -->
            <p class="chapter">
              <a href="index.html">INHOUD</a>
              <xsl:text> | hoofdstuk: 1 </xsl:text>
              <xsl:for-each-group select="current-group()" group-by="Chapter">
                <xsl:sort select="number(Chapter)"/>
                <xsl:if test="number(current-grouping-key()) &gt; 1">
                  <a href="#{$book}-{current-grouping-key()}">
                    <xsl:text>[</xsl:text>
                    <xsl:value-of select="current-grouping-key()"/>
                    <xsl:text>]</xsl:text>
                  </a>
                  <xsl:text> </xsl:text>
                </xsl:if>
              </xsl:for-each-group>
            </p>
            <!-- Chapters -->
            <xsl:for-each-group select="current-group()" group-by="Chapter">
              <xsl:sort select="number(Chapter)"/>
              <xsl:if test="number(current-grouping-key()) &gt; 1">
                <p class="chapter page" id="{$book}-{current-grouping-key()}">
                  <a href="index.html">INHOUD</a>
                  <xsl:text> | </xsl:text>
                  <a href="#{$book}">
                    <xsl:text>[</xsl:text>
                    <xsl:value-of select="$book-long"/>
                    <xsl:text>]</xsl:text>
                  </a>
                </p>
              </xsl:if>
              <!-- Chapter heading -->
              <h2>
                <xsl:text>Hoofdstuk </xsl:text>
                <xsl:value-of select="current-grouping-key()"/>
              </h2>
              <!-- Verses -->
              <xsl:for-each select="current-group()">
                <sup><xsl:value-of select="Verse"/><xsl:text> </xsl:text></sup>
                <xsl:value-of select="Scripture"/>
                <xsl:text> </xsl:text>
              </xsl:for-each>
            </xsl:for-each-group>
          </body>
        </html>
      </xsl:result-document>
    </xsl:for-each-group>
  </xsl:template>

</xsl:stylesheet>


