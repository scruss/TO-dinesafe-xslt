<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <!-- ☞
       dinesafetopsv.xsl - make pipe separated vaules from
       Toronto Open Data Dine Safe Report
       typically (zipped) at
       http://opendata.toronto.ca/public.health/dinesafe/dinesafe.zip
       scruss - 2015-06-27 - WTFPL (srsly)
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
      <xsl:value-of select="$record_sep"/>
      
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>

