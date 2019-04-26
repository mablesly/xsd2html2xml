<?xml version="1.0"?>
<xsl:stylesheet
	version="3.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema">



	<!-- handle elements with type attribute add the options to the select -->
	<xsl:template match="xs:element" name="add_p3sc_select">
        <!--
	    <xsl:message>
            element called.
            begin<xsl:copy-of select="." />end
            begin<xsl:value-of select="@name" />end
	    </xsl:message>
        -->

        <xsl:element name="select">
			<xsl:attribute name="onchange">
				<xsl:text>this.childNodes.forEach(function(o) { if (o.nodeType == Node.ELEMENT_NODE) o.removeAttribute("selected"); }); this.children[this.selectedIndex].setAttribute("selected","selected");</xsl:text>
			</xsl:attribute>
			<xsl:for-each select="./xs:element">
                <xsl:element name="option">
                    <xsl:attribute name="data-xsd2html2xml-type">element</xsl:attribute>
                    <xsl:attribute name="data-xsd2html2xml-name"><xsl:value-of select="@name" /></xsl:attribute>
                    <xsl:attribute name="value"><xsl:value-of select="@name" /></xsl:attribute>

			        <xsl:value-of select="@name" />
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
	</xsl:template>
</xsl:stylesheet>
