<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text"/>

<!-- default: rush through everything, and do nothing -->
<xsl:template match="@*|text()"/>
<xsl:template mode="structural" match="@*|text()"/>
<xsl:template mode="definitions" match="@*|text()"/>

<!-- real deal: if we hit a leaf element in follow mode, print it's path and content -->
<xsl:template match="Request">
	<xsl:text>Request ::= SEQUENCE {&#10;</xsl:text>
	<xsl:for-each select="AVP">
		<xsl:value-of select="@name"/>
		<xsl:text> </xsl:text>
		<xsl:if test="@mapping">
			<xsl:text>SEQUENCE OF </xsl:text>
		</xsl:if>
		<xsl:value-of select="@name"/>
		<xsl:text> OPTIONAL,&#10;</xsl:text>
	</xsl:for-each>
	<xsl:text>}&#10;</xsl:text>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="AVP">
	<xsl:variable name="avpname" select="@name"/>
	<xsl:value-of select="@name"/>
	<xsl:text> ::= </xsl:text>
	<xsl:call-template name="printtag"/>
	<xsl:text> </xsl:text>
	<xsl:choose>
		<xsl:when test="not(child::AVP)">
			<xsl:call-template name="printtype"/>
		</xsl:when>
		<xsl:when test="child::AVP">
			<xsl:text>SEQUENCE {&#10;</xsl:text>
			<xsl:for-each select="AVP">
				<xsl:value-of select="@name"/>
				<xsl:text> </xsl:text>
				<xsl:if test="@mapping">
					<xsl:text>SEQUENCE OF </xsl:text>
				</xsl:if>
				<xsl:value-of select="@name"/>
				<xsl:text> OPTIONAL,&#10;</xsl:text>
			</xsl:for-each>
			<xsl:text>}</xsl:text>
		</xsl:when>
	</xsl:choose>
	<xsl:text>&#10;</xsl:text>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template name="printtag">
	<xsl:variable name="avpname" select="@name"/>
	<xsl:text>[</xsl:text>
	<xsl:choose>
		<xsl:when test="/Protocol/AVP_Def[@name=$avpname]/@vendorId">
			<xsl:value-of select="/Protocol/AVP_Def[@name=$avpname]/@vendorId * 32768 + /Protocol/AVP_Def[@name=$avpname]/@code"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="/Protocol/AVP_Def[@name=$avpname]/@code"/>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:text>]</xsl:text>
</xsl:template>

<xsl:template name="printtype">
	<xsl:variable name="avpname" select="@name"/>
	<xsl:variable name="avptype" select="/Protocol/AVP_Def[@name=$avpname]/@type"/>
	<xsl:choose>
		<xsl:when test="$avptype='Integer32'">
			<xsl:text>INTEGER</xsl:text>
		</xsl:when>
		<xsl:when test="$avptype='Unsigned32'">
			<xsl:text>INTEGER</xsl:text>
		</xsl:when>
		<xsl:when test="$avptype='Enumerated'">
			<xsl:text>INTEGER</xsl:text>
		</xsl:when>
		<xsl:when test="$avptype='OctetString'">
			<xsl:text>OCTET STRING</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$avptype"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>



</xsl:stylesheet>
