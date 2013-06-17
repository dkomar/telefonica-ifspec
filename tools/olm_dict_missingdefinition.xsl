<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text"/>

<!-- default: rush through everything, and do nothing -->
<xsl:template match="@*|text()"/>

<xsl:template match="/">
	<xsl:text>The following fields are defined in AVP tag, but missing the corresponding AVP_Def tag:</xsl:text>
	<xsl:text>&#10;</xsl:text>
	<xsl:apply-templates/>
</xsl:template>


<!-- real deal: if we hit a leaf element in follow mode, print it's path and content -->
<xsl:template match="AVP">
	<xsl:variable name="AVPName" select="@name"/>
	<xsl:if test="not(/Protocol/AVP_Def[@name = $AVPName])">
		<xsl:call-template name="printpath"/>
	</xsl:if>
	<xsl:apply-templates/>
</xsl:template>

<!-- helper function to dump the path of the node under the cursor -->
<xsl:template name="printpath">
	<xsl:for-each select="ancestor-or-self::*">
		<xsl:sort select="count(ancestor::*)" order="ascending"/>
		<xsl:choose>
			<xsl:when test="name() = 'AVP'">
				<xsl:variable name="AVPName" select="@name"/>
				<xsl:value-of select="concat( '/', $AVPName)"/>
			</xsl:when>
			<xsl:when test="name() = 'Request'">
				<xsl:value-of select="concat(@name, ':')"/>
			</xsl:when>
			<xsl:when test="name() = 'Response'">
				<xsl:value-of select="concat(@name, ':')"/>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:for-each>
	<xsl:text>&#10;</xsl:text>
</xsl:template>

</xsl:stylesheet>
