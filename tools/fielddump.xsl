<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text"/>

<!-- default: rush through everything, and do nothing -->
<xsl:template match="@*|text()"/>

<!-- real deal: if we hit a leaf element in follow mode, print it's path and content -->
<xsl:template match="AVP">
	<xsl:call-template name="printpath"/>
	<xsl:text>&#10;</xsl:text>
	<xsl:apply-templates/>
</xsl:template>

<!-- helper function to dump the path of the node under the cursor -->
<xsl:template name="printpath">
	<xsl:variable name="leafavpname" select="@name"/>
	<xsl:for-each select="ancestor-or-self::*">
		<xsl:sort select="count(ancestor::*)" order="ascending"/>
		<xsl:variable name="avpname" select="@name"/>
		<xsl:variable name="avpvendor" select="/Protocol/AVP_Def[@name=$avpname]/@vendorId"/>
		<xsl:variable name="avpcode" select="/Protocol/AVP_Def[@name=$avpname]/@code"/>
		<xsl:variable name="avptype" select="/Protocol/AVP_Def[@name=$avpname]/@type"/>
		<xsl:choose>
			<xsl:when test="name() = 'AVP'">
				<xsl:value-of select="concat('/', @name)"/>
				<xsl:if test="@mapping"><xsl:text>[*]</xsl:text></xsl:if>
				<xsl:if test="$leafavpname = $avpname">
					<xsl:value-of select="concat('{', $avpvendor, ',', $avpcode, ',', $avptype, '}')"/></xsl:if>
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
</xsl:template>

</xsl:stylesheet>
