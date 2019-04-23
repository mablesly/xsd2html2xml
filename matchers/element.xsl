<?xml version="1.0"?>
<xsl:stylesheet
	version="3.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema">



	<!-- handle elements with type attribute add the options to the select -->
	<xsl:template match="xs:element" name="add_options">

	    <xsl:message>
            element called.
            begin<xsl:copy-of select="." />end
            begin<xsl:value-of select="@name" />end
	    </xsl:message>

        <xsl:element name="option">
            <xsl:attribute name="value"><xsl:value-of select="@name" /></xsl:attribute>
			<xsl:value-of select="@name" />
        </xsl:element>
	</xsl:template>
</xsl:stylesheet>
