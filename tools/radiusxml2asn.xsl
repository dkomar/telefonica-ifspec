<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text"/>

<!-- default: rush through everything, and do nothing -->
<xsl:template match="@*|text()"/>
<xsl:template mode="structural" match="@*|text()"/>
<xsl:template mode="definitions" match="@*|text()"/>

<!-- real deal: if we hit a leaf element in follow mode, print it's path and content -->
<xsl:template match="/Protocol">
	<xsl:text>Request ::= SEQUENCE {&#10;</xsl:text>
	<xsl:for-each select="VSA|AVP">
		<xsl:value-of select="@name"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="@name"/>
		<xsl:text> OPTIONAL,&#10;</xsl:text>
	</xsl:for-each>
	<xsl:text>}&#10;</xsl:text>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="VSA|AVP">
	<xsl:variable name="avpname" select="@name"/>
	<xsl:value-of select="@name"/>
	<xsl:text> ::= </xsl:text>
	<xsl:call-template name="printtag"/>
	<xsl:text> </xsl:text>
	<xsl:call-template name="printtype"/>
	<xsl:text>&#10;</xsl:text>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template name="printtag">
	<xsl:variable name="avpname" select="@name"/>
	<xsl:text>[</xsl:text>
	<xsl:choose>
		<xsl:when test="@vendorId">
			<xsl:value-of select="@vendorId * 32768 + @type"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="@type"/>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:text>]</xsl:text>
</xsl:template>

<xsl:template name="printtype">
	<xsl:variable name="avpname" select="@name"/>
	<xsl:variable name="avptype" select="@datatype"/>
	<xsl:choose>
		<xsl:when test="$avptype='int'">
			<xsl:text>INTEGER</xsl:text>
		</xsl:when>
		<xsl:when test="$avptype='ipv6addr'">
			<xsl:text>Address128</xsl:text>
		</xsl:when>
		<xsl:when test="$avptype='address32'">
			<xsl:text>Address32</xsl:text>
		</xsl:when>
		<xsl:when test="$avptype='string'">
			<xsl:text>OCTET STRING</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$avptype"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>



</xsl:stylesheet>
