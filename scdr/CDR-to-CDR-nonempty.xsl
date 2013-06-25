<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes" encoding="utf-8"/>
<xsl:strip-space elements="*"/>

<xsl:template match="@*|comment()|text()">
	<xsl:copy>
		<xsl:apply-templates/>
	</xsl:copy>
</xsl:template>

<xsl:template match="node()">
	<xsl:if test="descendant-or-self::text()[normalize-space()]">
		<xsl:copy>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>
