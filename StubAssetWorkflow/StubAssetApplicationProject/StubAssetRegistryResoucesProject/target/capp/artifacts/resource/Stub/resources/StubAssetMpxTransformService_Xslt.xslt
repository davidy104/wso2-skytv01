<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" exclude-result-prefixes="ns2"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns1="http://service.skytv.co.nz/puborch-transform/v1"
	xmlns:ns2="http://model.skytv.co.nz/vod/v1" xmlns:sky="http://xml.theplatform.com/media/data/sky">
	<xsl:template match="/">
		<xsl:element name="ns1:TransformResponse">
			<xsl:apply-templates select="ns1:TransformRequest/source" />
		</xsl:element>
	</xsl:template>

	<xsl:template match="source">
		<rss version="2.0" xmlns:sky="http://xml.theplatform.com/media/data/sky">
			<channel>
				<xsl:for-each select="ns2:Title">
					<item>
						<title>
							<xsl:value-of select="ns2:title" />
						</title>
						<description>
							<xsl:value-of select="ns2:synopsis" />
						</description>
						<sky:skyID>
							<xsl:value-of select="ns2:titleId" />
						</sky:skyID>
						<sky:seasonID>
							<xsl:value-of select="ns2:seriesId" />
						</sky:seasonID>
						<sky:seasonTitle>
							<xsl:value-of select="concat(ns2:seriesName,ns2:seriesYear)" />
						</sky:seasonTitle>
						<sky:seasonNumber>
							<xsl:value-of select="ns2:seriesYear" />
						</sky:seasonNumber>
						<sky:episodeNumber>
							<xsl:value-of select="ns2:episodeNumber" />
						</sky:episodeNumber>

						<xsl:for-each select="ns2:casts/ns2:cast">
							<credit personId="{ns2:castId}" creditID="{ns2:roleId}">
								<last>
									<xsl:value-of select="ns2:lastName" />
								</last>
								<first>
									<xsl:value-of select="ns2:firstName" />
								</first>
								<role>
									<xsl:value-of select="ns2:roleName" />
								</role>
							</credit>
						</xsl:for-each>

						<sky:studio>
							<xsl:value-of select="ns2:distributor" />
						</sky:studio>
						<sky:contentProviderID>
							<xsl:value-of select="ns2:contentProviderId" />
						</sky:contentProviderID>
						<sky:programType>
							<xsl:value-of select="ns2:type" />
						</sky:programType>
						<sky:releaseYear>
							<xsl:value-of select="ns2:yearOfProduction" />
						</sky:releaseYear>
						<sky:state>
							<xsl:value-of select="ns2:state" />
						</sky:state>
					</item>
				</xsl:for-each>
			</channel>
		</rss>
	</xsl:template>
</xsl:stylesheet>