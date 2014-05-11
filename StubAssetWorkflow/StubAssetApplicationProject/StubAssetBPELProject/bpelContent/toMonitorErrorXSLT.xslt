<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times"
	extension-element-prefixes="date">

	<xsl:variable name="currenttime" select="current-dateTime()" />
	<xsl:variable name="formatcurrenttime"
		select="format-dateTime($currenttime,'[Y0001]-[M01]-[D01] [H01]:[m01]:[s01]')" />

	<xsl:template match="*">
		<xsl:element name="ns1:Monitor"
			xmlns:ns1="http://service.skytv.co.nz/monitor-utility/v1">

			<xsl:element name="ns2:MonitorRecord"
				xmlns:ns2="http://model.skytv.co.nz/monitor-utility/v1">
				<ns2:serviceName>StubAssetProcess</ns2:serviceName>
				<ns2:instanceId></ns2:instanceId>
				<ns2:status>ERROR</ns2:status>
				<ns2:dateTime>
					<xsl:value-of select="$formatcurrenttime" />
				</ns2:dateTime>
				<ns2:details></ns2:details>
			</xsl:element>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>