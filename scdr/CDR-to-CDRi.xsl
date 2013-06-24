<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" indent="yes" encoding="utf-8"/>
<xsl:strip-space elements="*"/>

<xsl:template match="/callcase">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">universal</xsl:attribute>
		<xsl:attribute name="tag">16</xsl:attribute><!--sequence / sequence of -->
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//CDR">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">universal</xsl:attribute>
		<xsl:attribute name="tag">16</xsl:attribute><!--sequence / sequence of -->
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//layer">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">universal</xsl:attribute>
		<xsl:attribute name="tag">16</xsl:attribute><!--sequence / sequence of -->
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelServiceRecord">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="//mMTelRecord">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">83</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>



<xsl:template match="//mMTelRecord/recordType">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="conv">integer</xsl:attribute>
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">0</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/role-of-Node">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">3</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/session-Id">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">5</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>


<xsl:template match="//mMTelRecord/list-Of-Calling-Party-Address">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:for-each select="involvedParty">
		<xsl:element name="tag">
			<xsl:attribute name="class">context</xsl:attribute>
			<xsl:attribute name="tag">6</xsl:attribute>
			<xsl:call-template name="declarations"/>
		</xsl:element>
	</xsl:for-each>
</xsl:template>

<xsl:template match="//mMTelRecord/called-Party-Address">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:for-each select="involvedParty">
		<xsl:element name="tag">
			<xsl:attribute name="class">context</xsl:attribute>
			<xsl:attribute name="tag">7</xsl:attribute>
			<xsl:call-template name="declarations"/>
		</xsl:element>
	</xsl:for-each>
</xsl:template>

<xsl:template match="//mMTelRecord/serviceRequestTimeStamp">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">9</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/serviceDeliveryStartTimeStamp">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">10</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/serviceDeliveryEndTimeStamp">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">11</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/interOperatorIdentifiers">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:for-each select="value">
		<xsl:element name="tag">
			<xsl:attribute name="class">context</xsl:attribute>
			<xsl:attribute name="tag">14</xsl:attribute>
		<xsl:call-template name="declarations"/>
		</xsl:element>
	</xsl:for-each>
</xsl:template>

<xsl:template match="//mMTelRecord/causeForRecordClosing">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">17</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/iMS-Charging-Identifier">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">19</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/serviceContextID">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">30</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/iMSCommunicationServiceIdentifier">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">33</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/serviceRequestTimeStampFraction">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">37</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/serviceDeliveryStartTimeStampFraction">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">38</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/serviceDeliveryEndTimeStampFraction">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">39</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/list-Of-SDP-Media-Components">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:for-each select="media-Components-List">
		<xsl:element name="tag">
			<xsl:attribute name="class">context</xsl:attribute>
			<xsl:attribute name="tag">21</xsl:attribute>
		<xsl:call-template name="declarations"/>
		</xsl:element>
	</xsl:for-each>
</xsl:template>

<xsl:template match="//media-Components-List/sIP-Request-Timestamp">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">0</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//media-Components-List/sIP-Response-Timestamp">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">1</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//media-Components-List/sDP-Media-Components">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:for-each select="sDP-Media-Component">
		<xsl:element name="tag">
			<xsl:attribute name="class">context</xsl:attribute>
			<xsl:attribute name="tag">2</xsl:attribute>
		<xsl:call-template name="declarations"/>
		</xsl:element>
	</xsl:for-each>
</xsl:template>

<xsl:template match="//sDP-Media-Component/sDP-Media-Name">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">0</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//sDP-Media-Component/sDP-Media-Description">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:for-each select="value">
		<xsl:element name="tag">
			<xsl:attribute name="class">context</xsl:attribute>
			<xsl:attribute name="tag">1</xsl:attribute>
		<xsl:call-template name="declarations"/>
		</xsl:element>
	</xsl:for-each>
</xsl:template>

<xsl:template match="//media-Components-List/sDP-Session-Description">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:for-each select="value">
		<xsl:element name="tag">
			<xsl:attribute name="class">context</xsl:attribute>
			<xsl:attribute name="tag">4</xsl:attribute>
		<xsl:call-template name="declarations"/>
		</xsl:element>
	</xsl:for-each>
</xsl:template>

<xsl:template match="//media-Components-List/mediaInitiatorParty">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">5</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//media-Components-List/sIP-Request-Timestamp-Fraction">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">6</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>


<xsl:template match="//media-Components-List/sIP-Response-Timestamp-Fraction">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">7</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//media-Components-List/sDP-Type">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">5</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/list-of-subscription-ID">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:for-each select="subscriptionID">
		<xsl:element name="tag">
			<xsl:attribute name="class">context</xsl:attribute>
			<xsl:attribute name="tag">31</xsl:attribute>
		<xsl:call-template name="declarations"/>
		</xsl:element>
	</xsl:for-each>
</xsl:template>

<xsl:template match="//subscriptionID/subscriptionIDType">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">0</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//subscriptionID/subscriptionIDData">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">1</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/numberPortabilityRouting">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">34</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/list-Of-Called-Asserted-Identity">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:for-each select="involvedParty">
		<xsl:element name="tag">
			<xsl:attribute name="class">context</xsl:attribute>
			<xsl:attribute name="tag">102</xsl:attribute>
		<xsl:call-template name="declarations"/>
		</xsl:element>
	</xsl:for-each>
</xsl:template>

<xsl:template match="//mMTelRecord/serviceReasonReturnCode">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">23</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/recordExtensions">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">25</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/Access-Network-Information">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">29</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//mMTelRecord/serviceSpecificInfo">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:for-each select="value">
		<xsl:element name="tag">
			<xsl:attribute name="class">context</xsl:attribute>
			<xsl:attribute name="tag">100</xsl:attribute>
		<xsl:call-template name="declarations"/>
		</xsl:element>
	</xsl:for-each>
</xsl:template>


<xsl:template match="//mMTelRecord/requested-Party-Address">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:for-each select="involvedParty">
		<xsl:element name="tag">
			<xsl:attribute name="class">context</xsl:attribute>
			<xsl:attribute name="tag">101</xsl:attribute>
		<xsl:call-template name="declarations"/>
		</xsl:element>
	</xsl:for-each>
</xsl:template>

<xsl:template match="//mMTelRecord/mMTelInformation">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">110</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<!-- mMTelInformation -->
<xsl:template match="//mMTelInformation/listOfSupplServices">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:for-each select="SupplService">
		<xsl:element name="tag">
			<xsl:attribute name="class">context</xsl:attribute>
			<xsl:attribute name="tag">110</xsl:attribute>
		<xsl:call-template name="declarations"/>
		</xsl:element>
	</xsl:for-each>
</xsl:template>

<!-- listOfSupplServices/* -->
<xsl:template match="//listOfSupplServices/SupplService/serviceType">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">0</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//listOfSupplServices/SupplService/serviceMode">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">1</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<!-- interOperatorIdentifiers -->

<xsl:template match="//interOperatorIdentifiers/value/originatingIOI">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">0</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//interOperatorIdentifiers/value/terminatingIOI">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">1</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>


<!-- serviceSpecificInfo/* -->

<xsl:template match="//serviceSpecificInfo/value/serviceSpecificData">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">0</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//serviceSpecificInfo/value/serviceSpecificType">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">1</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>



<!-- recordExtensions/* -->
<xsl:template match="//recordExtensions/bW-service-provider">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">106</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//recordExtensions/bW-user-Number">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">108</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//recordExtensions/bW-dialed-Digits">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">122</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//recordExtensions/bW-call-Category">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">123</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//recordExtensions/bW-network-Translated-Number">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">125</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//recordExtensions/bW-codec">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">130</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//recordExtensions/bW-access-Callid">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">132</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//recordExtensions/bW-group">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">136</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//recordExtensions/bW-original-Called-Number">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">140</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//recordExtensions/bW-redirecting-Number">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">143</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//recordExtensions/bW-userId">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">225</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//recordExtensions/bW-other-Party-Name">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">226</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//recordExtensions/eMM-on-net-flag">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">325</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//recordExtensions/eMM-on-platform-flag">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">326</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//recordExtensions/eMM-faxmail-flag">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">327</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//recordExtensions/eMM-voicemail-flag">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">328</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//involvedParty/sip">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">0</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>

<xsl:template match="//involvedParty/tel">
	<xsl:comment><xsl:value-of select="name()"/></xsl:comment>
	<xsl:element name="tag">
		<xsl:attribute name="class">context</xsl:attribute>
		<xsl:attribute name="tag">1</xsl:attribute>
		<xsl:call-template name="declarations"/>
	</xsl:element>
</xsl:template>


<!-- named templates -->
<xsl:template name="declarations">
	<xsl:choose>
		<xsl:when test="count(*) &gt; 0">
			<xsl:attribute name="pc">constructed</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:attribute name="pc">primitive</xsl:attribute>
			<xsl:value-of select="normalize-space(text())"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="@*|comment()">
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="node()">
	<xsl:comment>
		<xsl:text>WARNING: untreated element</xsl:text>
		<xsl:value-of select="name()"/>
	</xsl:comment>
</xsl:template>

<xsl:template match="text()"/>

</xsl:stylesheet>
