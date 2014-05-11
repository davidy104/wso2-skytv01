<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" exclude-result-prefixes="ns2"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times"
	extension-element-prefixes="date"
	xmlns:ns2="http://service.skytv.co.nz/puborch-transform/v1">

	<xsl:variable name="currenttime" select="current-dateTime()" />
	<xsl:variable name="formatcurrenttime"
		select="format-dateTime($currenttime,'[D01][M01][Y0001]_[H01][m01][s01]')" />

	<xsl:template match="ns2:TransformResponse/rss">
		<xsl:element name="ns1:SendToFileServiceRequest"
			xmlns:ns1="https://service.skytv.co.nz/puborch-fileService/v1">
			<fileName>
				<xsl:value-of select="concat(concat('Stub_',$formatcurrenttime),'.xml')" />
			</fileName>
			<destination>FTP</destination>
			<contents>
				<rss version="2.0" xmlns:sky="http://xml.theplatform.com/media/data/sky">
					<channel>
						<xsl:for-each select="channel/item">
							<item>
								<guid isPermaLink="false">
									<xsl:value-of select="sky:skyID" />
								</guid>
								<title>
									<xsl:value-of select="title" />
								</title>
								<description>
									<xsl:value-of select="description" />
								</description>

								<sky:programType>
									<xsl:value-of select="sky:programType" />
								</sky:programType>
								<sky:studio>
									<xsl:value-of select="sky:studio" />
								</sky:studio>
								<sky:contentProviderId>
									<xsl:value-of select="sky:contentProviderID" />
								</sky:contentProviderId>
								<sky:state>
									<xsl:value-of select="sky:state" />
								</sky:state>
								<sky:episodeNumber>
									<xsl:value-of select="sky:episodeNumber" />
								</sky:episodeNumber>

								<sky:credits>
									<xsl:for-each select="credit">
										<credit personId="{@personId}" creditID="{@creditID}">
											<role>
												<xsl:value-of select="role" />
											</role>
											<last>
												<xsl:value-of select="last" />
											</last>
											<first>
												<xsl:value-of select="first" />
											</first>
										</credit>
									</xsl:for-each>
								</sky:credits>

							</item>
						</xsl:for-each>
					</channel>
				</rss>
			</contents>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>