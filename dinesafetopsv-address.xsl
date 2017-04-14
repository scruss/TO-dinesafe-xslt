<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <!-- ☞
       dinesafetopsv-address.xsl - make pipe separated vaules from
       Toronto Open Data Dine Safe Report with added address magic
       typically (zipped) at
       http://opendata.toronto.ca/public.health/dinesafe/dinesafe.zip
       scruss - 2017 - WTFPL (srsly) - except for the bit I
       nicked from Stack Overflow …
       ☜ -->
  <xsl:output encoding="UTF-8" method="text"/>
  
  <xsl:template match="/">

    <!-- ☞ definitions for field separator and delimiter,
	   and also record separator ☜ -->
    <xsl:variable name="field_sep">
      <xsl:text>|</xsl:text>
    </xsl:variable>
    
    <xsl:variable name="field_delim">
      <xsl:text></xsl:text>
    </xsl:variable>
    
    <xsl:variable name="record_sep">
      <!-- ☞ should be &#x0A; ☜ -->
      <xsl:text>&#x0A;</xsl:text>
    </xsl:variable>

    <!-- ☞ output header line ☜ -->
    <xsl:text>ROW_ID</xsl:text>
    <xsl:value-of select="$field_sep"/>
    <xsl:text>INSPECTION_ID</xsl:text>
    <xsl:value-of select="$field_sep"/>
    <xsl:text>INSPECTION_DATE</xsl:text>
    <xsl:value-of select="$field_sep"/>
    <xsl:text>ESTABLISHMENT_ID</xsl:text>
    <xsl:value-of select="$field_sep"/>
    <xsl:text>ESTABLISHMENT_NAME</xsl:text>
    <xsl:value-of select="$field_sep"/>
    <xsl:text>ESTABLISHMENTTYPE</xsl:text>
    <xsl:value-of select="$field_sep"/>
    <xsl:text>ESTABLISHMENT_ADDRESS</xsl:text>
    <xsl:value-of select="$field_sep"/>
    <xsl:text>ESTABLISHMENT_STATUS</xsl:text>
    <xsl:value-of select="$field_sep"/>
    <xsl:text>MINIMUM_INSPECTIONS_PERYEAR</xsl:text>
    <xsl:value-of select="$field_sep"/>
    <xsl:text>INFRACTION_DETAILS</xsl:text>
    <xsl:value-of select="$field_sep"/>
    <xsl:text>SEVERITY</xsl:text>
    <xsl:value-of select="$field_sep"/>
    <xsl:text>ACTION</xsl:text>
    <xsl:value-of select="$field_sep"/>
    <xsl:text>COURT_OUTCOME</xsl:text>
    <xsl:value-of select="$field_sep"/>
    <xsl:text>AMOUNT_FINED</xsl:text>
    <xsl:value-of select="$field_sep"/>
    <xsl:text>STREET_NUM</xsl:text>
    <xsl:value-of select="$field_sep"/>
    <xsl:text>STREET_NAME</xsl:text>
    <!-- ☞ end of header row ☜ -->
    <xsl:value-of select="$record_sep"/>

    <!-- ☞ output each record in the same order as header ☜ -->
    <xsl:for-each select="ROWDATA/ROW">
      <xsl:value-of select="ROW_ID"/>
      <xsl:value-of select="$field_sep"/>
      
      <xsl:value-of select="INSPECTION_ID"/>
      <xsl:value-of select="$field_sep"/>
      
      <xsl:value-of select="INSPECTION_DATE"/>
      <xsl:value-of select="$field_sep"/>
      
      <xsl:value-of select="ESTABLISHMENT_ID"/>
      <xsl:value-of select="$field_sep"/>
      
      <!-- ☞ fix iffy spacing in text fields ☜ -->
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="normalize-space(ESTABLISHMENT_NAME)"/>
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="$field_sep"/>
      
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="normalize-space(ESTABLISHMENTTYPE)"/>
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="$field_sep"/>
      
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="normalize-space(ESTABLISHMENT_ADDRESS)"/>
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="$field_sep"/>
      
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="normalize-space(ESTABLISHMENT_STATUS)"/>
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="$field_sep"/>
      
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="normalize-space(MINIMUM_INSPECTIONS_PERYEAR)"/>
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="$field_sep"/>
      
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="normalize-space(INFRACTION_DETAILS)"/>
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="$field_sep"/>
      
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="normalize-space(SEVERITY)"/>
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="$field_sep"/>
      
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="normalize-space(ACTION)"/>
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="$field_sep"/>
      
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="normalize-space(COURT_OUTCOME)"/>
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="$field_sep"/>
      
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="normalize-space(AMOUNT_FINED)"/>
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="$field_sep"/>

      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="substring-before(normalize-space(ESTABLISHMENT_ADDRESS),' ')"/>
      <xsl:value-of select="$field_delim"/>
      <xsl:value-of select="$field_sep"/>
      
      <xsl:value-of select="$field_delim"/>
      <xsl:call-template name="CamelCase">
	<xsl:with-param name="text"><xsl:value-of select="substring-after(normalize-space(ESTABLISHMENT_ADDRESS),' ')"/></xsl:with-param>
      </xsl:call-template>
      <xsl:value-of select="$field_delim"/>

      <!-- ☞ end of record row ☜ -->
      <xsl:value-of select="$record_sep"/>
      
    </xsl:for-each>
  </xsl:template>

  <!-- ☞
       nicked from
       https://stackoverflow.com/questions/13122545/convert-first-character-of-each-word-to-upper-case/13122990#13122990
       ☜ -->
  <xsl:template name="CamelCase">
    <xsl:param name="text"/>
    <xsl:choose>
      <xsl:when test="contains($text,' ')">
	<xsl:call-template name="CamelCaseWord">
          <xsl:with-param name="text" select="substring-before($text,' ')"/>
	</xsl:call-template>
	<xsl:text> </xsl:text>
	<xsl:call-template name="CamelCase">
          <xsl:with-param name="text" select="substring-after($text,' ')"/>
	</xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
	<xsl:call-template name="CamelCaseWord">
          <xsl:with-param name="text" select="$text"/>
	</xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="CamelCaseWord">
    <xsl:param name="text"/>
    <xsl:value-of select="translate(substring($text,1,1),'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')" /><xsl:value-of select="translate(substring($text,2,string-length($text)-1),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" />
  </xsl:template>
</xsl:stylesheet>
