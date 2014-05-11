<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns3="http://service.skytv.co.nz/ibms/v1"
	xmlns:ns4="http://model.skytv.co.nz/vod/v1">

	<xsl:template match="/">
		<xsl:element name="ns1:TransformRequest"
			xmlns:ns1="http://service.skytv.co.nz/puborch-transform/v1">
			<xsl:apply-templates select="ns3:GetVodTitleResponse" />
		</xsl:element>
	</xsl:template>


	<xsl:template match="ns3:GetVodTitleResponse">
		<xsl:element name="fromType">
			SKY
		</xsl:element>
		<xsl:element name="toType">
			MPXSTUB
		</xsl:element>

		<xsl:element name="source">
			<xsl:for-each select="ns4:Title">
				<xsl:element name="ns2:Title"
					xmlns:ns2="http://model.skytv.co.nz/vod/v1">
					<xsl:element name="ns2:titleId">
						<xsl:value-of select="ns4:titleId" />
					</xsl:element>
					<xsl:element name="ns2:title">
						<xsl:value-of select="ns4:title" />
					</xsl:element>
					<xsl:element name="ns2:episodeNumber">
						<xsl:value-of select="ns4:episodeNumber" />
					</xsl:element>
					<xsl:element name="ns2:yearOfProduction">
						<xsl:value-of select="ns4:yearOfProduction" />
					</xsl:element>
					<xsl:element name="ns2:type">
						<xsl:value-of select="ns4:type" />
					</xsl:element>
					<xsl:element name="ns2:distributor">
						<xsl:value-of select="ns4:distributor" />
					</xsl:element>

					<xsl:element name="ns2:contentProviderId">
						<xsl:value-of select="ns4:contentProviderId" />
					</xsl:element>
					<xsl:element name="ns2:state">
						<xsl:value-of select="ns4:state" />
					</xsl:element>
					<xsl:element name="ns2:seriesId">
						<xsl:value-of select="ns4:seriesId" />
					</xsl:element>
					<xsl:element name="ns2:seriesName">
						<xsl:value-of select="ns4:seriesName" />
					</xsl:element>
					<xsl:element name="ns2:seriesYear">
						<xsl:value-of select="ns4:seriesYear" />
					</xsl:element>
					<xsl:element name="ns2:synopsis">
						<xsl:value-of select="ns4:synopsis" />
					</xsl:element>

					<xsl:element name="ns2:casts">
						<xsl:for-each select="ns4:casts/ns4:cast">
							<xsl:element name="ns2:cast">
								<xsl:element name="ns2:castId">
									<xsl:value-of select="ns4:castId" />
								</xsl:element>
								<xsl:element name="ns2:roleId">
									<xsl:value-of select="ns4:roleId" />
								</xsl:element>
								<xsl:element name="ns2:roleName">
									<xsl:value-of select="ns4:roleName" />
								</xsl:element>
								<xsl:element name="ns2:firstName">
									<xsl:value-of select="ns4:firstName" />
								</xsl:element>
								<xsl:element name="ns2:lastName">
									<xsl:value-of select="ns4:lastName" />
								</xsl:element>
							</xsl:element>
						</xsl:for-each>
					</xsl:element>
				</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>

</xsl:stylesheet>