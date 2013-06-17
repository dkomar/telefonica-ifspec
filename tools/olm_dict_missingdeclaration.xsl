<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text"/>

<!-- default: rush through everything, and do nothing -->
<xsl:template match="@*|text()"/>

<xsl:template match="/">
	<xsl:text>The following fields are defined in AVP_Def tag, but missing the corresponding AVP tag in Request(s):</xsl:text>
	<xsl:text>&#10;</xsl:text>
	<xsl:apply-templates/>
</xsl:template>


<!-- real deal: if we hit a leaf element in follow mode, print it's path and content -->
<xsl:template match="AVP_Def">
	<xsl:variable name="AVPName" select="@name"/>
	<xsl:if test="not(/Protocol/Request/descendant-or-self::*[@name=$AVPName] or /Protocol/Response/descendant-or-self::*[@name=$AVPName])">
		<xsl:value-of select="@name"/>
		<xsl:text>&#10;</xsl:text>
	</xsl:if>
	<xsl:apply-templates/>
</xsl:template>

</xsl:stylesheet>
