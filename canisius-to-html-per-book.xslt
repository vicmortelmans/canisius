<?xml version="1.0"?>
<xsl:stylesheet version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes"/>

  <xsl:param name="dir" select="."/>

  <xsl:variable name="books" select="document('BibleConfiguration/books.xml')/books"/>
  
  <xsl:template match="/">
    <xsl:result-document href="{$dir}/index.html" method="html">
      <html>
        <head>
          <title>De Bijbel - Petrus Canisiusvertaling</title>
          <meta charset="utf-8"></meta>
          <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"></meta>
          <meta name="description" content="Katholieke Bijbelvertaling"></meta>
          <link rel="stylesheet" type="text/css" href="style.css"/>
          <!-- Global site tag (gtag.js) - Google Analytics -->
          <script async="true" src="https://www.googletagmanager.com/gtag/js?id=G-336L5CJ1CM"></script>
          <script>
              window.dataLayer = window.dataLayer || [];
              function gtag(){dataLayer.push(arguments);}
              gtag('js', new Date());

              gtag('config', 'G-336L5CJ1CM');
          </script>
        </head>
        <body>
          <div>
            <p class="title">Katholieke Bijbelvertaling<br/>Petrus Canisius</p>
            <p>De Heilige Schrift, vertaling uit de grondtekst in opdracht van de Apologetische Vereniging 'Petrus Canisius' ondernomen met goedkeuring van de hoogwaardige bisschoppen van Nederland</p>
            <p>Oorspronkelijke uitgave 1939</p>
            <p><a href="http://www.gelovenleren.net">gelovenleren.net</a></p>
          </div>
          <!-- TOC with list of books -->
          <p id="inhoud" class="page"><b>Oude Testament</b></p>
          <p>
            <xsl:for-each-group select="dataroot/Bible[number(Book_x0020_ID) &lt; 40]" group-by="Book_x0020_ID">
              <xsl:sort select="number(Book_x0020_ID)"/>
              <xsl:variable name="book" select="replace($books/book[code[@service='can']=current-grouping-key()]/input[contains(@language,'nl')],' ','-')"/>
              <xsl:variable name="book-long" select="$books/book[code[@service='can']=current-grouping-key()]/input[1]"/>
              <a href="{$book}.html">
                <xsl:value-of select="$book-long"/>
              </a>
              <xsl:text> </xsl:text>
            </xsl:for-each-group>
          </p>
          <p><b>Deuterocanonieke Boeken</b></p>
          <p>
            <xsl:for-each-group select="dataroot/Bible[number(Book_x0020_ID) &gt; 66]" group-by="Book_x0020_ID">
              <xsl:sort select="number(Book_x0020_ID)"/>
              <xsl:variable name="book" select="replace($books/book[code[@service='can']=current-grouping-key()]/input[contains(@language,'nl')],' ','-')"/>
              <xsl:variable name="book-long" select="$books/book[code[@service='can']=current-grouping-key()]/input[1]"/>
              <a href="{$book}.html">
                <xsl:value-of select="$book-long"/>
              </a>
              <xsl:text> </xsl:text>
            </xsl:for-each-group>
          </p>
          <p><b>Nieuwe Testament</b></p>
          <p>
            <xsl:for-each-group select="dataroot/Bible[number(Book_x0020_ID) &gt; 39 and number(Book_x0020_ID) &lt; 67]" group-by="Book_x0020_ID">
              <xsl:sort select="number(Book_x0020_ID)"/>
              <xsl:variable name="book" select="replace($books/book[code[@service='can']=current-grouping-key()]/input[contains(@language,'nl')],' ','-')"/>
              <xsl:variable name="book-long" select="$books/book[code[@service='can']=current-grouping-key()]/input[1]"/>
              <a href="{$book}.html">
                <xsl:value-of select="$book-long"/>
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
      <xsl:variable name="book" select="replace($books/book[code[@service='can']=current-grouping-key()]/input[contains(@language,'nl')],' ','-')"/>
      <xsl:variable name="book-long" select="$books/book[code[@service='can']=current-grouping-key()]/input[1]"/>
      <xsl:result-document href="{$dir}/{$book}.html" method="html">
        <html>
          <head>
            <title>De Bijbel - Petrus Canisiusvertaling</title>
            <meta charset="utf-8"></meta>
            <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover"></meta>
            <meta name="description" content="Katholieke Bijbelvertaling"></meta>
            <link rel="stylesheet" type="text/css" href="style.css"/>
            <!-- Global site tag (gtag.js) - Google Analytics -->
            <script async="true" src="https://www.googletagmanager.com/gtag/js?id=G-336L5CJ1CM"></script>
            <script>
                window.dataLayer = window.dataLayer || [];
                function gtag(){dataLayer.push(arguments);}
                gtag('js', new Date());

                gtag('config', 'G-336L5CJ1CM');
            </script>
          </head>
          <body>
            <div>
              <p class="title">Katholieke Bijbelvertaling<br/>Petrus Canisius</p>
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
              <a href="index.html">BIJBEL</a>
              <xsl:text> hoofdstuk: </xsl:text>
              <a href="#{$book}">
                <xsl:text>1</xsl:text>
              </a>
              <xsl:for-each-group select="current-group()" group-by="Chapter">
                <xsl:sort select="number(Chapter)"/>
                <xsl:if test="number(current-grouping-key()) &gt; 1">
                  <a href="#{$book}-{current-grouping-key()}">
                    <xsl:value-of select="current-grouping-key()"/>
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
                  <a href="index.html">BIJBEL</a>
                  <xsl:text> </xsl:text>
                  <a href="#{$book}">
                    <xsl:value-of select="$book-long"/>
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


