<?xml version="1.0"?>
<xsl:stylesheet
	version="3.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema">

	<xsl:template match="xs:choice">

		<xsl:param name="root-document" /> <!-- contains root document -->
		<xsl:param name="root-path" /> <!-- contains path from root to included and imported documents -->
		<xsl:param name="root-namespaces" /> <!-- contains root document's namespaces and prefixes -->

		<xsl:param name="namespace-documents" /> <!-- contains all documents in element namespace -->
		<xsl:param name="namespace-prefix" /> <!-- contains inherited namespace prefix -->

		<xsl:param name="choice" /> <!-- handles xs:choice elements and descendants; contains a unique ID for radio buttons of the same group to share -->
		<xsl:param name="xpath" /> <!-- contains an XPath query relative to the current node, to be used with xml document -->
		<xsl:param name="disabled">false</xsl:param> <!-- is used to disable elements that are copies for additional occurrences -->

		<xsl:call-template name="log">
			<xsl:with-param name="reference">choice</xsl:with-param>
		</xsl:call-template>

        <xsl:message>
		    choice recognised
		    root-document: <xsl:value-of select="$root-document" />
		    root-path: <xsl:value-of select="$root-path" />
		    choice: <xsl:value-of select="$choice" />
		    xpath: <xsl:value-of select="$xpath" />
		    id: <xsl:value-of select="generate-id()" />
		    current: <xsl:value-of select="." />
		    parent: <xsl:value-of select=".." />
		</xsl:message>

        <xsl:element name="select">
            blaat
            <xsl:for-each select="./element">
                <xsl:call-template name="add_options" />
            </xsl:for-each>
        </xsl:element>

		<!-- add radio button if $choice is specified -->
		<xsl:if test="not($choice = '') and not($choice = 'true')">
			<xsl:call-template name="add-choice-button">
				<!-- $choice contains a unique id and is used for the options name -->
				<xsl:with-param name="name" select="$choice" />
				<xsl:with-param name="description">
					<xsl:value-of select="count(preceding-sibling::*) + 1" />
				</xsl:with-param>
				<xsl:with-param name="disabled" select="$disabled" />
			</xsl:call-template>
		</xsl:if>

        <xsl:if test="$choice = 'true'">
            <xsl:message>
		        choice is true
		    </xsl:message>
        </xsl:if>

        <xsl:if test="$choice = ''">
            <xsl:message>
		        choice is empty
		    </xsl:message>
        </xsl:if>

		<xsl:apply-templates select="xs:element|xs:group|xs:choice|xs:sequence|xs:any">
			<xsl:with-param name="root-document" select="$root-document" />
			<xsl:with-param name="root-path" select="$root-path" />
			<xsl:with-param name="root-namespaces" select="$root-namespaces" />

			<xsl:with-param name="namespace-documents" select="$namespace-documents" />
			<xsl:with-param name="namespace-prefix" select="$namespace-prefix" />

			<xsl:with-param name="choice" select="generate-id()" />
			<xsl:with-param name="disabled" select="$disabled" />
			<xsl:with-param name="xpath" select="$xpath" />
		</xsl:apply-templates>
	</xsl:template>

</xsl:stylesheet>
