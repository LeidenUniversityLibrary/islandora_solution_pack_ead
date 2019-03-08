<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="1.0" xmlns:ead="urn:isbn:1-931666-22-9">
    <xsl:strip-space elements="*"/>
    <xsl:output indent="yes" method="html" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" encoding="utf-8"/>

    <!-- Creates the body of the finding aid.-->

    <xsl:variable name="language">
        <xsl:value-of
            select="ead:ead/ead:eadheader/ead:profiledesc/ead:langusage/ead:language/@langcode"/>
    </xsl:variable>



    <xsl:variable name="dscType">
        <xsl:value-of select="ead:archdesc/ead:dsc/@type"/>
    </xsl:variable>

    <xsl:variable name="top">
        <xsl:text>Go to the top of the page</xsl:text>
    </xsl:variable>

    <xsl:variable name="file">
        <xsl:value-of select="ead:eadheader/ead:eadid"/>
    </xsl:variable>

    <xsl:template match="ead:ead">
       <div class="ead-whole">
       <div class="ead-toc">
         <h3 class="toc-header">
           <xsl:choose>
             <xsl:when test="$language = 'dut' ">
               Inhoudsopgave
             </xsl:when>
             <xsl:otherwise>
               Table of Contents
             </xsl:otherwise>
           </xsl:choose>
           <a href="#" title="close table of contents" id="closetoc">
             <i class="fa fa-close" aria-hidden="true"></i>
           </a>
         </h3>
         <div class="toc-content">
           <xsl:call-template name="toc"/>
         </div>
       </div>
       <div class="islandora-ead-content-wrapper clearfix islandora-viewer">
         <div class="ead-content">
           <xsl:call-template name="body"/>
         </div>
       </div>
       </div>
    </xsl:template>

    <xsl:template name="toc">
      <ul>
        <li>
          <xsl:choose>
              <xsl:when test="$language = 'eng' ">
                  <a href="#ead0" class="nav">Collection
                  description</a>
              </xsl:when>
              <xsl:when test="$language = 'dut' ">
                  <a href="#ead0" class="nav"
                  >Collectiebeschrijving</a>
              </xsl:when>
          </xsl:choose>
          <ul>
            <li>
              <xsl:choose>
                  <xsl:when test="$language = 'eng' ">
                      <a href="#ead1" class="nav">Brief description</a>
                  </xsl:when>
                  <xsl:when test="$language = 'dut' ">
                      <a href="#ead1" class="nav">Beknopte
                      beschrijving</a>
                  </xsl:when>
              </xsl:choose>
	    </li>
            <xsl:if test="ead:archdesc/ead:descgrp[@type = 'context' ]">
            <li>
              <xsl:choose>
                  <xsl:when test="$language = 'eng' ">
                      <a href="#ead2" class="nav">Origination and
                          acquisition</a>
                  </xsl:when>
                  <xsl:when test="$language = 'dut' ">
                      <a href="#ead2" class="nav">Herkomst en
                          verwerving</a>
                  </xsl:when>
              </xsl:choose>
            </li>
            </xsl:if>
            <xsl:if test="ead:archdesc/ead:descgrp[@type = 'content_and_structure' ]">
            <li>
              <xsl:choose>
                  <xsl:when test="$language = 'eng' ">
                      <a href="#ead3" class="nav">Contents and
                          structure</a>
                  </xsl:when>
                  <xsl:when test="$language = 'dut' ">
                      <a href="#ead3" class="nav">Inhoud en
                          samenstelling</a>
                  </xsl:when>
              </xsl:choose>
            </li>
            </xsl:if>
            <xsl:if test="ead:archdesc/ead:descgrp[@type = 'access_and_use' ]">
            <li>
              <xsl:choose>
                  <xsl:when test="$language = 'eng' ">
                      <a href="#ead4" class="nav">User
                      instructions</a>
                  </xsl:when>
                  <xsl:when test="$language = 'dut' ">
                      <a href="#ead4" class="nav">Aanwijzingen voor de
                          gebruiker</a>
                  </xsl:when>
              </xsl:choose>
            </li>
            </xsl:if>
            <xsl:if test="ead:archdesc/ead:descgrp[@type = 'allied_material' ]">
            <li>
              <xsl:choose>
                  <xsl:when test="$language = 'eng' ">
                      <a href="#ead5" class="nav">Related material</a>
                  </xsl:when>
                  <xsl:when test="$language = 'dut' ">
                      <a href="#ead5" class="nav">Verwant
                      materiaal</a>
                  </xsl:when>
              </xsl:choose>
            </li>
            </xsl:if>

            <xsl:if test="ead:archdesc/ead:descgrp[@type = 'appendices' ]">
            <li>
              <xsl:choose>
                  <xsl:when test="$language = 'eng' ">
                      <a href="#ead6" class="nav">Literature</a>
                  </xsl:when>
                  <xsl:when test="$language = 'dut' ">
                      <a href="#ead6" class="nav">Literatuur</a>
                  </xsl:when>
              </xsl:choose>
            </li>
            </xsl:if>

            <xsl:if test="ead:archdesc/ead:controlaccess">
            <li>
              <xsl:choose>
                  <xsl:when test="$language = 'eng' ">
                      <a href="#ead7" class="nav">Subjects</a>
                  </xsl:when>
                  <xsl:when test="$language = 'dut' ">
                      <a href="#ead7" class="nav">Trefwoorden</a>
                  </xsl:when>
              </xsl:choose>
            </li>
            </xsl:if>
          </ul>
        </li>
        <xsl:if test="ead:archdesc/ead:dsc">
        <li>
          <xsl:element name="a">
              <xsl:attribute name="href">
                  <xsl:text>#ead-dsc</xsl:text>
              </xsl:attribute>
              <xsl:attribute name="class">
                  <xsl:text>nav</xsl:text>
              </xsl:attribute>
              <xsl:choose>
                  <xsl:when test="ead:archdesc/ead:dsc/ead:head">
                      <xsl:value-of select="ead:archdesc/ead:dsc/ead:head"/>
                  </xsl:when>
                  <xsl:otherwise>
                      <xsl:choose>
                          <xsl:when test="$language = 'eng' ">
                          Inventory </xsl:when>
                          <xsl:when test="$language = 'dut' ">
                          Inventaris </xsl:when>
                      </xsl:choose>
                  </xsl:otherwise>
              </xsl:choose>
          </xsl:element>
          <xsl:if test="ead:archdesc/ead:dsc/ead:c01[@level !='item' and @level != 'file' ]">
          <ul>
            <xsl:for-each
                 select="ead:archdesc/ead:dsc/ead:c01[@level !='item' and @level != 'file' ]">
              <li>
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:text>#</xsl:text>

                        <xsl:value-of select="@id"/>


                    </xsl:attribute>

                    <xsl:attribute name="class">
                        <xsl:text>nav</xsl:text>
                    </xsl:attribute>

                    <xsl:if test="ead:did/ead:unitid/@type = 'EAD' ">

                    <xsl:apply-templates select="ead:did/ead:unitid"/>
                    <xsl:text> </xsl:text>
                    </xsl:if>
                    <xsl:apply-templates select="ead:did/ead:unittitle"/>
                </xsl:element>
                <xsl:if test="ead:c02[@level !='item' and  @level != 'file' ]">
                <ul>
                  <xsl:for-each
                      select="ead:c02[@level !='item' and  @level != 'file' ]">
                  <li>
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:text>#</xsl:text>
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <xsl:attribute name="class">
                            <xsl:text>nav</xsl:text>
                        </xsl:attribute>
                        <xsl:if test="ead:did/ead:unitid/@type = 'EAD' ">

                            <xsl:apply-templates select="ead:did/ead:unitid"/>
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:apply-templates select="ead:did/ead:unittitle" />
                    </xsl:element>
                    <xsl:if test="ead:c03[@level !='item' and @level != 'file' ]">
                    <ul>
                      <xsl:for-each
                          select="ead:c03[@level !='item' and @level != 'file' ]">
                      <li>
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                            <xsl:text>#</xsl:text>
                            <xsl:value-of select="@id"/>
                            </xsl:attribute>
                            <xsl:attribute name="class">
                            <xsl:text>nav</xsl:text>
                            </xsl:attribute>
                            <xsl:if test="ead:did/ead:unitid/@type = 'EAD' ">

                                <xsl:apply-templates select="ead:did/ead:unitid"/>

                            </xsl:if>
                            <xsl:apply-templates
                            select="ead:did/ead:unittitle"/>
                        </xsl:element>
                      </li>
                      </xsl:for-each>
                    </ul>
                    </xsl:if>
                  </li>
                  </xsl:for-each>
                </ul>
                </xsl:if>
              </li>
            </xsl:for-each>
          </ul>
          </xsl:if>
        </li>
        </xsl:if>
      </ul>
    </xsl:template>


    <xsl:template name="body">


<!--
        <div valign="middle" class="top" height="50">

            <xsl:attribute name="align">
                <xsl:text>right</xsl:text>

            </xsl:attribute>


            <xsl:element name="table">




                <xsl:element name="tr">





                    <xsl:element name="td">

                        <xsl:element name="div">


                            <div class="searchBox" id="searchBox">




                                <b>Search:</b>
                                <span style="width:5px"/>
                                <input type="text" id="SearchText"
                                    style="padding-right: 5px; padding-left: 5px;"/>
                                <span style="width:5px"/>
                                <input type="button" value="Find Next"
                                    onClick="FindString()" class="buttonInput"/>
                            </div>

                        </xsl:element>

                    </xsl:element>

                    <xsl:element name="td">

                        <xsl:attribute name="width">

                            <xsl:text>10%</xsl:text>
                        </xsl:attribute>

                    </xsl:element>
                </xsl:element>

            </xsl:element>


        </div>
        -->

        <div id="divMain" style="overflow:auto;" class="body">

            <xsl:call-template name="head"/>

            <xsl:apply-templates select="ead:archdesc"/>

        </div>


    </xsl:template>

    <xsl:template name="head">


        <xsl:element name="a">
            <xsl:attribute name="class"><xsl:text>ead-section</xsl:text></xsl:attribute><xsl:attribute name="name">
                <xsl:text>ead0</xsl:text>
            </xsl:attribute>
        </xsl:element>


        <p>
            <br/>
        </p>

        <xsl:element name="div">

            <xsl:attribute name="align">
                <xsl:text>center</xsl:text>

            </xsl:attribute>


            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:text>/sites/all/themes/uvl/img/beeldmerk_wit.gif</xsl:text>

                </xsl:attribute>

            </xsl:element>

            <xsl:element name="h1">
                <xsl:value-of select="ead:archdesc/ead:did/ead:unittitle"/>

            </xsl:element>

            <xsl:element name="h4">


                <xsl:choose>
                    <xsl:when test="$language = 'eng' ">

                        <xsl:text>Collection guide written by:</xsl:text>

                    </xsl:when>
                    <xsl:otherwise>


                        <xsl:text>Collectiebeschrijving gemaakt door:</xsl:text>
                    </xsl:otherwise>


                </xsl:choose>
            </xsl:element>

            <xsl:value-of select="ead:eadheader/ead:filedesc/ead:titlestmt/ead:author"/>


            <xsl:element name="br"/>


            <xsl:element name="h4">
                <xsl:choose>
                    <xsl:when test="$language = 'eng' ">

                        <xsl:text>Digital version:</xsl:text>

                    </xsl:when>
                    <xsl:otherwise>


                        <xsl:text>Digitale versie:</xsl:text>
                    </xsl:otherwise>


                </xsl:choose>

            </xsl:element>

            <xsl:value-of select="ead:eadheader/ead:profiledesc/ead:creation"/>


            <xsl:element name="br"/>


            <xsl:element name="h4">
                <xsl:choose>
                    <xsl:when test="$language = 'eng' ">

                        <xsl:text>Version update:</xsl:text>

                    </xsl:when>
                    <xsl:otherwise>


                        <xsl:text>Versie update:</xsl:text>
                    </xsl:otherwise>


                </xsl:choose>

            </xsl:element>

            <xsl:value-of select="ead:eadheader/ead:revisiondesc/ead:change/ead:date"/>


            <xsl:element name="br"/>

        </xsl:element>


        <xsl:element name="p">
            <xsl:element name="br"/>
        </xsl:element>



    </xsl:template>

    <xsl:template name="top-bar-right">
        <xsl:for-each select="ead:eadheader/ead:filedesc/ead:titlestmt">

            <a name="a0"/>

            <TABLE CELLPADDING="0" CELLSPACING="0" BORDER="0" WIDTH="100%">
                <TR>
                    <TD STYLE="PADDING-TOP:2; PADDING-BOTTOM:2PX; height:26px;"
                        align="center">
                        <div class="ead_title">
                            <xsl:value-of select="ead:titleproper"/>
                        </div>
                    </TD>
                </TR>
                <tr>
                    <td align="right">
                        <div class="searchBox" id="searchBox">
                            <b>Search:</b>
                            <span style="width:5px"/>
                            <input type="text" id="SearchText"
                                style="padding-right: 5px; padding-left: 5px;"/>
                            <span style="width:5px"/>
                            <input type="button" value="Find Next"
                                onClick="FindString()" class="buttonInput"/>
                        </div>
                    </td>

                </tr>
            </TABLE>

        </xsl:for-each>
    </xsl:template>



    <xsl:template match="ead:archdesc/ead:did">



        <xsl:element name="a">
            <xsl:attribute name="class"><xsl:text>ead-section</xsl:text></xsl:attribute><xsl:attribute name="name">
                <xsl:text>ead1</xsl:text>
            </xsl:attribute>
        </xsl:element>
        <xsl:element name="table">
            <xsl:attribute name="width">
                <xsl:text>100%</xsl:text>
            </xsl:attribute>
            <xsl:element name="tr">
                <xsl:element name="td">
                    <h3>
                        <xsl:choose>
                            <xsl:when test="$language = 'eng' ">
                                <xsl:text>Brief description</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>Beknopte beschrijving</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </h3>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        <hr/>
        <blockquote>
            <table>
                <tr>
                    <td width="15%"/>
                    <td width="85%"/>
                </tr>
                <xsl:if test="ead:unittitle[string-length(text()|*)!=0]">
                    <xsl:for-each select="ead:unittitle">
                        <tr>
                            <td valign="top">
                                <b>
                                    <xsl:choose>
                                        <xsl:when test="@label">
                                        <xsl:value-of select="@label"/>
                                        </xsl:when>
                                        <xsl:otherwise>

                                            <xsl:choose>
                                                <xsl:when test="$language = 'eng' ">
                                                    <xsl:text>Title:</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:text>Titel:</xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>

                                        </xsl:otherwise>
                                    </xsl:choose>
                                </b>
                            </td>
                            <td>
                                <xsl:apply-templates select="."/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="ead:origination[string-length(text()|*)!=0]">
                    <xsl:for-each select="ead:origination">
                        <tr>
                            <td valign="top">
                                <b>
                                    <xsl:choose>
                                        <xsl:when test="@label">
                                        <xsl:value-of select="@label"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:choose>
                                                <xsl:when test="$language = 'eng' ">
                                                    <xsl:text>Origination:</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:text>Herkomst:</xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </b>
                            </td>
                            <td>
                                <xsl:apply-templates select="."/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="ead:unitdate[string-length(text()|*)!=0]">
                    <xsl:for-each select="ead:unitdate">
                        <tr>
                            <td valign="top">
                                <b>
                                    <xsl:choose>
                                        <xsl:when test="@label">
                                        <xsl:value-of select="@label"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        <xsl:choose>
                                        <xsl:when test="@type='bulk' ">
                                            <xsl:choose>
                                                <xsl:when test="$language = 'eng' ">
                                                    <xsl:text>Date (bulk):</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:text>Datering (merendeel):</xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>

                                        <xsl:otherwise>
                                            <xsl:choose>
                                                <xsl:when test="$language = 'eng' ">
                                                    <xsl:text>Date:</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:text>Datering:</xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:otherwise>
                                        </xsl:choose>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </b>
                            </td>
                            <td>
                                <xsl:apply-templates select="."/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="ead:physdesc[string-length(text()|*)!=0]">
                    <xsl:for-each select="ead:physdesc">
                        <tr>
                            <td valign="top">
                                <b>
                                    <xsl:choose>
                                        <xsl:when test="@label">
                                        <xsl:value-of select="@label"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:choose>
                                                <xsl:when test="$language = 'eng' ">
                                                    <xsl:text>Extent:</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:text>Omvang:</xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </b>
                            </td>
                            <td>
                                <xsl:apply-templates select="."/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="ead:langmaterial[string-length(text()|*)!=0]">
                    <xsl:for-each select="ead:langmaterial">
                        <tr>
                            <td valign="top">
                                <b>
                                    <xsl:choose>
                                        <xsl:when test="@label">
                                        <xsl:value-of select="@label"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:choose>
                                                <xsl:when test="$language = 'eng' ">
                                                    <xsl:text>Language:</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:text>Taal:</xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </b>
                            </td>
                            <td>
                                <xsl:apply-templates select="."/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="ead:abstract[string-length(text()|*)!=0]">
                    <xsl:for-each select="ead:abstract">
                        <tr>
                            <td valign="top">
                                <b>
                                    <xsl:choose>
                                        <xsl:when test="@langcode='dut'">
                                        <xsl:text>Korte samenvatting: </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        <xsl:text>Abstract: </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </b>
                            </td>
                            <td>
                                <xsl:apply-templates select="."/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="ead:unitid[string-length(text()|*)!=0]">
                    <xsl:for-each select="ead:unitid">
                        <tr>
                            <td valign="top">
                                <b>
                                    <xsl:choose>
                                        <xsl:when test="@label">
                                        <xsl:value-of select="@label"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        <xsl:text>Collectienummer: </xsl:text>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </b>
                            </td>
                            <td>
                                <xsl:apply-templates select="."/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="ead:repository[string-length(text()|*)!=0]">
                    <xsl:for-each select="ead:repository">
                        <tr>
                            <td valign="top">
                                <b>
                                    <xsl:choose>
                                        <xsl:when test="@label">
                                        <xsl:value-of select="@label"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:choose>
                                                <xsl:when test="$language = 'eng' ">
                                                    <xsl:text>Institution:</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:text>Instelling:</xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </b>
                            </td>
                            <td>
                                <xsl:apply-templates select="."/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="ead:physloc[string-length(text()|*)!=0]">
                    <xsl:for-each select="ead:physloc">
                        <tr>
                            <td valign="top">
                                <b>
                                    <xsl:choose>
                                        <xsl:when test="@label">
                                        <xsl:value-of select="@label"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:choose>
                                                <xsl:when test="$language = 'eng' ">
                                                    <xsl:text>Location:</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:text>Bewaarplaats:</xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </b>
                            </td>
                            <td>
                                <xsl:apply-templates select="."/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </xsl:if>
            </table>
            <br/>
        </blockquote>

    </xsl:template>
    <xsl:template match="ead:archdesc/ead:descgrp">
        <xsl:choose>
            <xsl:when test="@type='context'">

                <xsl:element name="a" class="ead-section">
                    <xsl:attribute name="class"><xsl:text>ead-section</xsl:text></xsl:attribute><xsl:attribute name="name">
                        <xsl:text>ead2</xsl:text>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="table">
                    <xsl:attribute name="width">
                        <xsl:text>100%</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="tr">
                        <xsl:element name="td">

                            <p>
                                <br/>
                            </p>

                            <h3>
                                <xsl:choose>
                                    <xsl:when test="$language = 'eng' ">
                                        <xsl:text>Origination and acquisition</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>Herkomst en verwerving</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </h3>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:attribute name="align">
                                <xsl:text>right</xsl:text>
                            </xsl:attribute>
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>#ead0</xsl:text>
                                </xsl:attribute>
                                <xsl:element name="img">
                                    <xsl:attribute name="src">
                                        <xsl:text>/sites/all/themes/uvl/img/top.gif</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="border">
                                        <xsl:text>0</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:value-of select="$top"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="title">
                                        <xsl:value-of select="$top"/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
                <hr/>
                <xsl:call-template name="blockquote"/>

            </xsl:when>
            <xsl:when test="@type='content_and_structure'">

                <xsl:element name="a">
                    <xsl:attribute name="class"><xsl:text>ead-section</xsl:text></xsl:attribute><xsl:attribute name="name">
                        <xsl:text>ead3</xsl:text>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="table">
                    <xsl:attribute name="width">
                        <xsl:text>100%</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="tr">
                        <xsl:element name="td">

                            <p>
                                <br/>
                            </p>

                            <h3>
                                <xsl:choose>
                                    <xsl:when test="$language = 'eng' ">
                                        <xsl:text>Contents and structure</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>Inhoud en samenstelling</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </h3>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:attribute name="align">
                                <xsl:text>right</xsl:text>
                            </xsl:attribute>
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>#ead0</xsl:text>
                                </xsl:attribute>
                                <xsl:element name="img">
                                    <xsl:attribute name="src">
                                        <xsl:text>/sites/all/themes/uvl/img/top.gif</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="border">
                                        <xsl:text>0</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:value-of select="$top"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="title">
                                        <xsl:value-of select="$top"/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
                <hr/>
                <xsl:call-template name="blockquote"/>

            </xsl:when>
            <xsl:when test="@type='access_and_use'">

                <xsl:element name="a">
                    <xsl:attribute name="class"><xsl:text>ead-section</xsl:text></xsl:attribute><xsl:attribute name="name">
                        <xsl:text>ead4</xsl:text>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="table">
                    <xsl:attribute name="width">
                        <xsl:text>100%</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="tr">
                        <xsl:element name="td">

                            <p>
                                <br/>
                            </p>
                            <h3>
                                <xsl:choose>
                                    <xsl:when test="$language = 'eng' ">
                                        <xsl:text>User instructions</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>Aanwijzingen voor de gebruiker</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </h3>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:attribute name="align">
                                <xsl:text>right</xsl:text>
                            </xsl:attribute>
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>#ead0</xsl:text>
                                </xsl:attribute>
                                <xsl:element name="img">
                                    <xsl:attribute name="src">
                                        <xsl:text>/sites/all/themes/uvl/img/top.gif</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="border">
                                        <xsl:text>0</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:value-of select="$top"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="title">
                                        <xsl:value-of select="$top"/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
                <hr/>
                <xsl:call-template name="blockquote"/>

            </xsl:when>
            <xsl:when test="@type='allied_material'">

                <xsl:element name="a">
                    <xsl:attribute name="class"><xsl:text>ead-section</xsl:text></xsl:attribute><xsl:attribute name="name">
                        <xsl:text>ead5</xsl:text>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="table">
                    <xsl:attribute name="width">
                        <xsl:text>100%</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="tr">
                        <xsl:element name="td">


                            <p>
                                <br/>
                            </p>
                            <h3>
                                <xsl:choose>
                                    <xsl:when test="$language = 'eng' ">
                                        <xsl:text>Related materials</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>Verwant materiaal</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </h3>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:attribute name="align">
                                <xsl:text>right</xsl:text>
                            </xsl:attribute>
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>#ead0</xsl:text>
                                </xsl:attribute>
                                <xsl:element name="img">
                                    <xsl:attribute name="src">
                                        <xsl:text>/sites/all/themes/uvl/img/top.gif</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="border">
                                        <xsl:text>0</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:value-of select="$top"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="title">
                                        <xsl:value-of select="$top"/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
                <hr/>
                <xsl:call-template name="blockquote"/>

            </xsl:when>
            <xsl:when test="@type='appendices'">

                <xsl:element name="a">
                    <xsl:attribute name="class"><xsl:text>ead-section</xsl:text></xsl:attribute><xsl:attribute name="name">
                        <xsl:text>ead6</xsl:text>
                    </xsl:attribute>
                </xsl:element>
                <xsl:element name="table">
                    <xsl:attribute name="width">
                        <xsl:text>100%</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="tr">
                        <xsl:element name="td">

                            <p>
                                <br/>
                            </p>

                            <h3>
                                <xsl:choose>
                                    <xsl:when test="$language = 'eng' ">
                                        <xsl:text>Literature</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>Literatuur</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </h3>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:attribute name="align">
                                <xsl:text>right</xsl:text>
                            </xsl:attribute>
                            <xsl:element name="a">
                                <xsl:attribute name="href">
                                    <xsl:text>#ead0</xsl:text>
                                </xsl:attribute>
                                <xsl:element name="img">
                                    <xsl:attribute name="src">
                                        <xsl:text>/sites/all/themes/uvl/img/top.gif</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="border">
                                        <xsl:text>0</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt">
                                        <xsl:value-of select="$top"/>
                                    </xsl:attribute>
                                    <xsl:attribute name="title">
                                        <xsl:value-of select="$top"/>
                                    </xsl:attribute>
                                </xsl:element>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
                <hr/>
                <xsl:call-template name="blockquote"/>

            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="ead:archdesc/ead:dsc">

        <a name="ead-dsc" class="ead-section"/>

        <xsl:element name="br"/>
        <xsl:element name="br"/>


        <xsl:element name="table">
            <xsl:attribute name="width">
                <xsl:text>100%</xsl:text>
            </xsl:attribute>
            <xsl:element name="tr">
                <xsl:element name="td">

                    <p>
                        <br/>
                    </p>

                    <h3>
                        <xsl:choose>
                            <xsl:when test="string-length(ead:head) > 0 ">
                                <xsl:apply-templates select="ead:head"/>
                            </xsl:when>
                            <xsl:when test="$language = 'eng' ">
                                <xsl:text>Contents list</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>Inventaris</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </h3>
                </xsl:element>
                <xsl:element name="td">
                    <xsl:attribute name="align">
                        <xsl:text>right</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:text>#ead0</xsl:text>
                        </xsl:attribute>
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:text>/sites/all/themes/uvl/img/top.gif</xsl:text>
                            </xsl:attribute>
                            <xsl:attribute name="border">
                                <xsl:text>0</xsl:text>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="$top"/>
                            </xsl:attribute>
                            <xsl:attribute name="title">
                                <xsl:value-of select="$top"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        <hr/>
        <xsl:if test="ead:p">
            <xsl:element name="blockquote">
                <xsl:apply-templates select="."/>
            </xsl:element>
        </xsl:if>
        <table width="100%" border="0" cellspacing="15">
            <tr>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
                <td width="5%"/>
            </tr>
            <xsl:apply-templates select="ead:c01"/>
        </table>
    </xsl:template>
    <xsl:template name="blockquote">
        <blockquote>
            <xsl:apply-templates/>
            <xsl:if test="*/ead:p/ead:note">
                <p>
                    <b>
                        <i>
                            <xsl:choose>
                                <xsl:when test="contains($language, 'eng')">
                                    <xsl:text>Notes</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>Noten</xsl:text>
                                    <br/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </i>
                    </b>
                </p>
            </xsl:if>
            <xsl:apply-templates select=".//ead:note[normalize-space()]"
                mode="footnotes"/>
        </blockquote>

    </xsl:template>
    <xsl:template match="ead:chronlist">
        <table border="1" style="margin: 1em 2em 1em 2em">
            <tr>
                <th style="padding: 0.3em 1em 0.3em 1em">
                    <xsl:value-of select="ead:listhead/ead:head01"/>
                </th>
                <th style="padding: 0.3em 1em 0.3em 1em">
                    <xsl:value-of select="ead:listhead/ead:head02"/>
                </th>
            </tr>
            <xsl:for-each select="ead:chronitem">
                <tr>
                    <td style="padding: 0.3em 1em 0.3em 1em">
                        <xsl:value-of select="ead:date"/>
                    </td>
                    <td style="padding: 0.3em 1em 0.3em 1em">
                        <xsl:value-of select="ead:event"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
    <xsl:template match="ead:list">
        <xsl:choose>
            <xsl:when test="@type= 'deflist'">
                <ul>
                    <xsl:for-each select="ead:defitem">
                        <li>
                            <xsl:apply-templates/>
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:when>
            <xsl:otherwise>
                <ul>
                    <xsl:for-each select="ead:item">
                        <li>
                            <xsl:apply-templates/>
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="ead:table">
        <table>
            <tr>
                <xsl:for-each select="ead:tgroup/ead:colspec">
                    <td>
                        <xsl:attribute name="width">
                            <xsl:value-of select="@colwidth"/>
                        </xsl:attribute>
                    </td>
                </xsl:for-each>
                <xsl:apply-templates select="ead:tgroup/ead:tbody/ead:row"/>
            </tr>
        </table>
    </xsl:template>
    <xsl:template match="ead:table//ead:row">
        <tr>
            <xsl:for-each select="ead:entry">
                <td>
                    <xsl:value-of select="."/>
                </td>
            </xsl:for-each>
        </tr>
    </xsl:template>
    <xsl:template match="ead:defitem/ead:label">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>
    <xsl:template match="ead:defitem/ead:item">
        <br/>
        <xsl:apply-templates/>
    </xsl:template>




    <xsl:template match="ead:userestrict//ead:extref">

        <xsl:element name="a">

            <xsl:attribute name="target">

                <xsl:text>_blank</xsl:text>

            </xsl:attribute>



            <xsl:attribute name="href">
                <xsl:text>https://www.bibliotheek.universiteitleiden.nl/bezoek-en-gebruik/praktische-informatie-bijzondere-collecties/toegang</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>


    <xsl:template match="ead:extref">
        <xsl:variable name="exthref">
            <xsl:value-of select="@href"/>
        </xsl:variable>
        <xsl:element name="a">

            <xsl:attribute name="target">

                <xsl:text>_blank</xsl:text>

            </xsl:attribute>



            <xsl:attribute name="href">
                <xsl:if test="@role = 'EAD' ">
                    <xsl:text>https://socrates.leidenuniv.nl/view/xserver/view.jsp?request=</xsl:text>
                </xsl:if>


                <xsl:value-of select="$exthref"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="ead:extptr">
        <xsl:variable name="exthref">
            <xsl:value-of select="@href"/>
        </xsl:variable>
        <img src="{$exthref}"/>
    </xsl:template>
    <xsl:template match="ead:archref">
        <xsl:variable name="link">
            <xsl:value-of select="@href"/>
        </xsl:variable>
        <xsl:variable name="show">
            <xsl:value-of select="@show"/>
        </xsl:variable>
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="$link"/>
            </xsl:attribute>
            <xsl:attribute name="target">
                <xsl:choose>
                    <xsl:when test="$show = 'replace' ">
                        <xsl:text>_self</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>_top</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="ead:scopecontent//ead:archref">
        <xsl:variable name="link">
            <xsl:value-of select="@href"/>
        </xsl:variable>
        <xsl:variable name="show">
            <xsl:value-of select="@show"/>
        </xsl:variable>
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="$link"/>
            </xsl:attribute>
            <xsl:attribute name="target">
                <xsl:choose>
                    <xsl:when test="$show = 'replace' ">
                        <xsl:text>_self</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>_top</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:value-of select="ead:unittitle"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="ead:ref">
        <xsl:variable name="link">
            <xsl:value-of select="@target"/>
        </xsl:variable>
        <xsl:variable name="show">
            <xsl:value-of select="@show"/>
        </xsl:variable>
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:text>#</xsl:text>
                <xsl:value-of select="$link"/>
            </xsl:attribute>
            <xsl:attribute name="target">
                <xsl:choose>
                    <xsl:when test="$show = 'replace' ">
                        <xsl:text>_self</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>_top</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="ead:note">
        <xsl:variable name="href">
            <xsl:value-of select="count(preceding::ead:note[normalize-space()])+1"/>
        </xsl:variable>
        <a>
            <xsl:attribute name="href">
                <xsl:value-of select="concat('#n', $href )"/>
            </xsl:attribute>
            <xsl:text>[</xsl:text>
            <xsl:value-of select="$href"/>
            <xsl:text>]</xsl:text>
        </a>
    </xsl:template>
    <xsl:template match="ead:note" mode="footnotes">
        <xsl:element name="a">
            <xsl:attribute name="name">
                <xsl:text>n</xsl:text>
                <xsl:value-of
                    select="count(preceding::ead:note[normalize-space()])+1"/>
            </xsl:attribute>
        </xsl:element>
        <xsl:value-of
            select="concat(count(preceding::ead:note[normalize-space()])+1, '. ') "/>
        <xsl:apply-templates mode="footnotes"/>
        <xsl:element name="br"/>
    </xsl:template>
    <xsl:template match="ead:descgrp//ead:note/ead:p" mode="footnotes">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="ead:descgrp/ead:bioghist">
        <a name="a3"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>
                    <xsl:when test="$language = 'eng' ">

                        <xsl:choose>
                            <xsl:when test="/ead:ead/ead:archdesc/ead:did/ead:origination">
                                <xsl:text>Biography</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>History note</xsl:otherwise>
                        </xsl:choose>

                    </xsl:when>


                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="/ead:ead/ead:archdesc/ead:did/ead:origination">
                                <xsl:text>Biografie</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>Historische context</xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>
    <xsl:template match="ead:descgrp/ead:custodhist">
        <a name="a4"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>

                    <xsl:when test="$language = 'eng' ">
                        <xsl:text>Custodial history</xsl:text>
                    </xsl:when>

                    <xsl:otherwise>
                        <xsl:text>Herkomstgeschiedenis</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>
    <xsl:template match="ead:descgrp/ead:acqinfo">
        <a name="a5"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>
                    <xsl:when test="$language = 'eng' ">
                        <xsl:text>Acquisition</xsl:text>
                    </xsl:when>

                    <xsl:otherwise>
                        <xsl:text>Verwerving</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>
    <xsl:template match="ead:descgrp/ead:appraisal">
        <a name="a6"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>

                    <xsl:when test="$language = 'eng' ">
                        <xsl:text>Appraisal</xsl:text>
                    </xsl:when>

                    <xsl:otherwise>
                        <xsl:text>Beoordeling</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>
    <xsl:template match="ead:descgrp/ead:accruals">
        <a name="a7"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>
                    <xsl:when test="$language = 'eng' ">
                        <xsl:text>Future additions</xsl:text>
                    </xsl:when>

                    <xsl:otherwise>
                        <xsl:text>Toekomstige aanvullingen</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>
    <xsl:template match="ead:descgrp/ead:scopecontent">
        <a name="a8"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>
                    <xsl:when test="$language = 'eng' ">
                        <xsl:text>Contents and organisation </xsl:text>
                    </xsl:when>

                    <xsl:otherwise>
                        <xsl:text>Specificatie inhoud</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>
    <xsl:template match="ead:descgrp/ead:processinfo">
        <a name="a9"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>
                    <xsl:when test="$language = 'eng' ">
                        <xsl:text>Processing history</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>Bewerking</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>
    <xsl:template match="ead:descgrp/ead:arrangement">
        <a name="a10"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>
                    <xsl:when test="$language = 'eng' ">
                        <xsl:text>Arrangement of the collection</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>Ordening van de collectie</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>
    <xsl:template match="ead:descgrp/ead:accessrestrict">
        <a name="a11"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>

                    <xsl:when test="$language = 'eng' ">
                        <xsl:text>Restrictions on access</xsl:text>
                    </xsl:when>

                    <xsl:otherwise>
                        <xsl:text>Openbaarheidsbeperkingen</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>
    <xsl:template match="ead:descgrp/ead:otherfindaid">
        <a name="a12"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>

                    <xsl:when test="$language = 'eng' ">
                        <xsl:text>Collection access</xsl:text>
                    </xsl:when>

                    <xsl:otherwise>
                        <xsl:text>Toegang tot de collectie</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>
    <xsl:template match="ead:descgrp/ead:altformavail">
        <a name="a13"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>
                    <xsl:when test="$language = 'eng' ">
                        <xsl:text>Alternative form available </xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>Alternatieve informatiedrager</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>

    <xsl:template match="ead:descgrp/ead:userestrict">
        <a name="a14"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>
                    <xsl:when test="$language = 'eng' ">
                        <xsl:text>Restrictions on use</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>Beperkingen aan het gebruik</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>

    <xsl:template match="ead:descgrp/ead:phystech">
        <a name="a15"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>
                    <xsl:when test="$language = 'eng' ">
                        <xsl:text>Physical details</xsl:text>
                    </xsl:when>

                    <xsl:otherwise>
                        <xsl:text>Fysieke kenmerken en technische vereisten</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>
    <xsl:template match="ead:descgrp/ead:prefercite">
        <a name="a16"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>
                    <xsl:when test="$language = 'eng' ">
                        <xsl:text>Preferred citation</xsl:text>
                    </xsl:when>

                    <xsl:otherwise>
                        <xsl:text>Citeerinstructies</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>
    <xsl:template match="ead:descgrp/ead:odd">
        <a name="a21"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>

                    <xsl:when test="$language = 'eng' ">
                        <xsl:text>Request instructions</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>Aanvraaginstructies</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>
    <xsl:template match="ead:descgrp/ead:relatedmaterial">
        <a name="a17"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>

                    <xsl:when test="$language = 'eng' ">
                        <xsl:text>Related materials</xsl:text>
                    </xsl:when>

                    <xsl:otherwise>
                        <xsl:text>Verwante collecties</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>
    <xsl:template match="ead:descgrp/ead:separatedmaterial">
        <a name="a18"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>

                    <xsl:when test="$language = 'eng' ">
                        <xsl:text>Separated material </xsl:text>
                    </xsl:when>

                    <xsl:otherwise>
                        <xsl:text>Elders ondergebracht materiaal</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>
    <xsl:template match="ead:descgrp/ead:originalsloc">
        <a name="a19"/>
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>
                    <xsl:when test="$language = 'eng' ">
                        <xsl:text>Location of originals</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>Bewaarplaats van originelen</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        <xsl:apply-templates select="*[local-name() != 'head' ]"/>
    </xsl:template>
    <xsl:template match="ead:controlaccess[position()=1]">


        <xsl:element name="a">
            <xsl:attribute name="class"><xsl:text>ead-section</xsl:text></xsl:attribute><xsl:attribute name="name">
                <xsl:text>ead7</xsl:text>
            </xsl:attribute>
        </xsl:element>


        <xsl:element name="table">
            <xsl:attribute name="width">
                <xsl:text>100%</xsl:text>
            </xsl:attribute>
            <xsl:element name="tr">
                <xsl:element name="td">
                    <p>
                        <br/>
                    </p>


                    <h3>
                        <xsl:choose>
                            <xsl:when test="contains($language, 'dut' )">
                                <h3>Gecontroleerde trefwoorden</h3>
                            </xsl:when>
                            <xsl:otherwise>
                                <h3>Subject headings</h3>
                            </xsl:otherwise>
                        </xsl:choose>
                    </h3>

                </xsl:element>
                <xsl:element name="td">
                    <xsl:attribute name="align">
                        <xsl:text>right</xsl:text>
                    </xsl:attribute>
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:text>#ead0</xsl:text>
                        </xsl:attribute>
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:text>/sites/all/themes/uvl/img/top.gif</xsl:text>
                            </xsl:attribute>
                            <xsl:attribute name="border">
                                <xsl:text>0</xsl:text>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="$top"/>
                            </xsl:attribute>
                            <xsl:attribute name="title">
                                <xsl:value-of select="$top"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>

        <hr/>

        <blockquote>
            <strong>
                <xsl:value-of select="ead:head"/>
            </strong>
            <ul>
                <xsl:apply-templates/>
            </ul>
        </blockquote>
    </xsl:template>
    <xsl:template match="ead:controlaccess[position() != 1]">
        <blockquote>
            <strong>
                <xsl:value-of select="ead:head"/>
            </strong>
            <ul>
                <xsl:apply-templates/>
            </ul>
        </blockquote>
    </xsl:template>
    <xsl:template match="ead:controlaccess/*">
        <xsl:if test="local-name()!='head'">
            <li>
                <xsl:value-of select="."/>
            </li>
        </xsl:if>
    </xsl:template>
    <xsl:template match="ead:bibliography">
        <a name="a20"/>

        <!--
        <p>
            <b>
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <xsl:apply-templates select="ead:head"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="$language = 'eng' ">
                                <xsl:text>Literature</xsl:text>
                            </xsl:when>
                            <xsl:when test="$language = 'dut' ">
                                <xsl:text>Literatuur</xsl:text>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </b>
        </p>
        -->
        <xsl:element name="table">

            <xsl:for-each select="*[local-name() != 'head' ]">
                <xsl:apply-templates select="."/>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    <xsl:template match="ead:bibref">
        <xsl:element name="tr">
            <xsl:element name="td">
                <xsl:attribute name="width">
                    <xsl:text>2%</xsl:text>
                </xsl:attribute>
                <xsl:attribute name="valign">
                    <xsl:text>top</xsl:text>
                </xsl:attribute>
                <xsl:text>- </xsl:text>
            </xsl:element>
            <xsl:element name="td">
                <xsl:apply-templates/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="ead:lb">
        <br/>
    </xsl:template>
    <xsl:template match="ead:emph[@render='bold']">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>
    <xsl:template match="ead:emph[@render='italic']">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>
    <xsl:template match="ead:emph[@render='underline']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>
    <xsl:template match="ead:emph[@render='sub']">
        <sub>
            <xsl:apply-templates/>
        </sub>
    </xsl:template>
    <xsl:template match="ead:emph[@render='super']">
        <super>
            <xsl:apply-templates/>
        </super>
    </xsl:template>
    <xsl:template match="ead:emph[@render='quoted']">
        <xsl:text>"</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>"</xsl:text>
    </xsl:template>
    <xsl:template match="ead:emph[@render='boldquoted']">
        <b>
            <xsl:text>"</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>"</xsl:text>
        </b>
    </xsl:template>
    <xsl:template match="ead:emph[@render='boldunderline']">
        <b>
            <u>
                <xsl:apply-templates/>
            </u>
        </b>
    </xsl:template>
    <xsl:template match="ead:emph[@render='bolditalic']">
        <b>
            <i>
                <xsl:apply-templates/>
            </i>
        </b>
    </xsl:template>
    <xsl:template match="ead:emph[@render='boldsmcaps']">
        <font style="font-variant: small-caps">
            <b>
                <xsl:apply-templates/>
            </b>
        </font>
    </xsl:template>
    <xsl:template match="ead:emph[@render='smcaps']">
        <font style="font-variant: small-caps">
            <xsl:apply-templates/>
        </font>
    </xsl:template>
    <xsl:template match="ead:title[@render='bold']">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>
    <xsl:template match="ead:title[@render='italic']">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>
    <xsl:template match="ead:title[@render='underline']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>
    <xsl:template match="ead:title[@render='sub']">
        <sub>
            <xsl:apply-templates/>
        </sub>
    </xsl:template>
    <xsl:template match="ead:title[@render='super']">
        <super>
            <xsl:apply-templates/>
        </super>
    </xsl:template>
    <xsl:template match="ead:title[@render='quoted']">
        <xsl:text>"</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>"</xsl:text>
    </xsl:template>
    <xsl:template match="ead:title[@render='boldquoted']">
        <b>
            <xsl:text>"</xsl:text>
            <xsl:apply-templates/>
            <xsl:text>"</xsl:text>
        </b>
    </xsl:template>
    <xsl:template match="ead:title[@render='boldunderline']">
        <b>
            <u>
                <xsl:apply-templates/>
            </u>
        </b>
    </xsl:template>
    <xsl:template match="ead:title[@render='singlequote']">
        <xsl:text>&apos;</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>&apos;</xsl:text>
    </xsl:template>
    <xsl:template match="ead:title[@render='bolditalic']">
        <b>
            <i>
                <xsl:apply-templates/>
            </i>
        </b>
    </xsl:template>
    <xsl:template match="ead:title[@render='boldsmcaps']">
        <font style="font-variant: small-caps">
            <b>
                <xsl:apply-templates/>
            </b>
        </font>
    </xsl:template>
    <xsl:template match="ead:title[@render='smcaps']">
        <font style="font-variant: small-caps">
            <xsl:apply-templates/>
        </font>
    </xsl:template>
    <xsl:template match="ead:c01">
        <tr>
            <td colspan="18" valign="top">
                <xsl:element name="a">
                    <xsl:attribute name="name">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:choose>
                    <xsl:when test="@level='item'  or @level='file' ">
                        <xsl:call-template name="item"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="series"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td colspan="2" align="right" valign="top">
                <br/>

                <xsl:if test="position() != 1">

                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:text>#ead0</xsl:text>
                        </xsl:attribute>
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:text>/sites/all/themes/uvl/img/top.gif</xsl:text>
                            </xsl:attribute>
                            <xsl:attribute name="border">
                                <xsl:text>0</xsl:text>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="$top"/>
                            </xsl:attribute>
                            <xsl:attribute name="title">
                                <xsl:value-of select="$top"/>
                            </xsl:attribute>
                        </xsl:element>
                    </xsl:element>

                </xsl:if>


            </td>
        </tr>
        <xsl:apply-templates select="ead:c02"/>
    </xsl:template>
    <xsl:template match="ead:c02">
        <tr>
            <td/>
            <td colspan="15" valign="top">
                <xsl:element name="a">
                    <xsl:attribute name="name">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                </xsl:element>
                <xsl:choose>
                    <xsl:when test="@level='item'  or @level='file' ">
                        <xsl:call-template name="item"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="series"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td colspan="4" align="right" valign="top">
                <xsl:apply-templates select="ead:did/ead:container[string-length(.)!=0]"
                />
            </td>
        </tr>
        <xsl:apply-templates select="ead:c03"/>
    </xsl:template>

   <xsl:template match="ead:c03">
        <tr>
            <td/>
            <td/>
            <td colspan="14" valign="top">
                <xsl:choose>
                    <xsl:when test="@level='item'  or @level='file' ">
                        <xsl:call-template name="item"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="series"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td colspan="4" align="right" valign="top">
                <xsl:apply-templates select="ead:did/ead:container[string-length(.)!=0]"
                />
            </td>
        </tr>
        <xsl:apply-templates select="ead:c04"/>
    </xsl:template>

    <xsl:template match="ead:c04">
        <tr>
            <td/>
            <td/>
            <td/>
            <td colspan="13" valign="top">
                <xsl:choose>
                    <xsl:when test="@level='item'  or @level='file' ">
                        <xsl:call-template name="item"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="series"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td colspan="4" align="right" valign="top">
                <xsl:apply-templates select="ead:did/ead:container[string-length(.)!=0]"
                />
            </td>
        </tr>
        <xsl:apply-templates select="ead:c05"/>
    </xsl:template>
    <xsl:template match="ead:c05">
        <tr>
            <td/>
            <td/>
            <td/>
            <td/>
            <td colspan="12" valign="top">
                <xsl:choose>
                    <xsl:when test="@level='item'  or @level='file' ">
                        <xsl:call-template name="item"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="series"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td colspan="4" align="right" valign="top">
                <xsl:apply-templates select="ead:did/ead:container[string-length(.)!=0]"
                />
            </td>
        </tr>
        <xsl:apply-templates select="ead:c06"/>
    </xsl:template>
    <xsl:template match="ead:c06">
        <tr>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td colspan="11" valign="top">
                <xsl:choose>
                    <xsl:when test="@level='item'  or @level='file' ">
                        <xsl:call-template name="item"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="series"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td colspan="4" align="right" valign="top">
                <xsl:apply-templates select="ead:did/ead:container[string-length(.)!=0]"
                />
            </td>
        </tr>
        <xsl:apply-templates select="ead:c07"/>
    </xsl:template>
    <xsl:template match="ead:c07">
        <tr>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td colspan="10" valign="top">
                <xsl:choose>
                    <xsl:when test="@level='item'  or @level='file' ">
                        <xsl:call-template name="item"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="series"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td colspan="4" align="right" valign="top">
                <xsl:apply-templates select="ead:did/ead:container[string-length(.)!=0]"
                />
            </td>
        </tr>
        <xsl:apply-templates select="ead:c08"/>
    </xsl:template>
    <xsl:template match="ead:c08">
        <tr>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td colspan="9" valign="top">
                <xsl:choose>
                    <xsl:when test="@level='item'  or @level='file' ">
                        <xsl:call-template name="item"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="series"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td colspan="4" align="right" valign="top">
                <xsl:apply-templates select="ead:did/ead:container[string-length(.)!=0]"
                />
            </td>
        </tr>
        <xsl:apply-templates select="ead:c09"/>
    </xsl:template>
    <xsl:template match="ead:c09">
        <tr>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td colspan="8" valign="top">
                <xsl:choose>
                    <xsl:when test="@level='item'  or @level='file' ">
                        <xsl:call-template name="item"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="series"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td colspan="4" align="right" valign="top">
                <xsl:apply-templates select="ead:did/ead:container[string-length(.)!=0]"
                />
            </td>
        </tr>
        <xsl:apply-templates select="ead:c10"/>
    </xsl:template>
    <xsl:template match="ead:c10">
        <tr>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td colspan="7" valign="top">
                <xsl:choose>
                    <xsl:when test="@level='item'  or @level='file' ">
                        <xsl:call-template name="item"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="series"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td colspan="4" align="right" valign="top">
                <xsl:apply-templates select="ead:did/ead:container[string-length(.)!=0]"
                />
            </td>
        </tr>
        <xsl:apply-templates select="ead:c11"/>
    </xsl:template>
    <xsl:template match="ead:c11">
        <tr>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td colspan="6" valign="top">
                <xsl:choose>
                    <xsl:when test="@level='item'  or @level='file' ">
                        <xsl:call-template name="item"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="series"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td colspan="4" align="right" valign="top">
                <xsl:apply-templates select="ead:did/ead:container[string-length(.)!=0]"
                />
            </td>
        </tr>
        <xsl:apply-templates select="ead:c12"/>
    </xsl:template>
    <xsl:template match="ead:c12">
        <tr>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td/>
            <td colspan="5" valign="top">
                <xsl:choose>
                    <xsl:when test="@level='item'  or @level='file' ">
                        <xsl:call-template name="item"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="series"/>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td colspan="4" align="right" valign="top">
                <xsl:apply-templates select="ead:did/ead:container[string-length(.)!=0]"
                />
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="ead:dao">

        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="@href"/>
            </xsl:attribute>
            <xsl:text>View image</xsl:text>
        </xsl:element>
        <p/>
    </xsl:template>


    <xsl:template match="ead:daogrp">
	<xsl:choose>
		<xsl:when test="ead:daoloc[ @label= 'thumbnail' ]">
			<xsl:element name="td">
				<xsl:attribute name="width">
					<xsl:text>20%</xsl:text>
				</xsl:attribute>

				<xsl:attribute name="valign">
					<xsl:text>top</xsl:text>
				</xsl:attribute>

				<xsl:element name="a">
					<xsl:attribute name="href">
						<xsl:value-of select="ead:daoloc[ @label= 'reference' ]/@href"/>
					</xsl:attribute>

					<xsl:attribute name="target">
						<xsl:text>_blank</xsl:text>
					</xsl:attribute>

					<xsl:if test="ead:daoloc[ @label= 'thumbnail' ] ">
						<xsl:element name="img">
							<xsl:attribute name="src">
								<xsl:value-of
									select="ead:daoloc[ @label= 'thumbnail' ]/@href"/>
							</xsl:attribute>
							<xsl:attribute name="width">
								<xsl:text>75</xsl:text>
							</xsl:attribute>
							<xsl:attribute name="border">
								<xsl:text>0</xsl:text>
							</xsl:attribute>
						</xsl:element>
					</xsl:if>
				</xsl:element>
			</xsl:element>
		</xsl:when>
	</xsl:choose>
    </xsl:template>




    <xsl:template name="item">
        <xsl:element name="table">
            <xsl:attribute name="width">
                <xsl:text>100%</xsl:text>
            </xsl:attribute>

            <xsl:element name="tr">

			<xsl:choose>
				<xsl:when test="not(ead:did/ead:daogrp/ead:daoloc[ @label= 'thumbnail' ])">
					<xsl:element name="td">
						<xsl:attribute name="valign">
							<xsl:text>top</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="width">
							<xsl:text>20%</xsl:text>
						</xsl:attribute>
					</xsl:element>
				</xsl:when>
			</xsl:choose>


                <xsl:apply-templates select="ead:did/ead:daogrp"/>
                <xsl:element name="td">
                    <xsl:attribute name="valign">
                        <xsl:text>top</xsl:text>
                    </xsl:attribute>


							<xsl:for-each select="@id">
							<a>
								<xsl:attribute name="name">
									<xsl:value-of select="."/>
								</xsl:attribute>
							</a>
							</xsl:for-each>


                    <xsl:for-each select="ead:did">
                        <xsl:if test="ead:unitid[@type != 'PPN' ]">
                            <xsl:for-each select="ead:unitid">
							                                <xsl:choose>
                                    <xsl:when test="@label">
                                        <i>
                                        <b>
                                        <xsl:value-of select="@label"/>
                                        </b>
                                        </i>
                                    </xsl:when>

                                    <xsl:otherwise>
                                        <xsl:if test="@type= 'signatuur' ">
                                        <i>
                                        <b>
                                        <xsl:choose>
                                        <xsl:when
                                        test="$language = 'eng' ">
                                        <xsl:text>Shelfmark: </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        <xsl:text>Signatuur: </xsl:text>
                                        </xsl:otherwise>
                                        </xsl:choose>
                                        </b>
                                        </i>
                                        </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>



                            </xsl:for-each>



                        </xsl:if>

						<xsl:choose>
							<xsl:when test="ead:daogrp/ead:daoloc[ @label= 'reference' ] ">

								<a>
									 <xsl:attribute name="href">
										<xsl:value-of select="ead:daogrp/ead:daoloc[ @label= 'reference' ]/@href"/>
									</xsl:attribute>
									<xsl:attribute name="name">
										<xsl:value-of select="./@id"/>
									</xsl:attribute>
									<xsl:attribute name="target">
										<xsl:text>_blank</xsl:text>
									</xsl:attribute>
									<xsl:value-of select="ead:unitid"/>
								</a>
							</xsl:when>
							<xsl:otherwise>
									<xsl:value-of select="ead:unitid"/>
							 </xsl:otherwise>
						</xsl:choose>
						<br/>

                        <xsl:if test="ead:unittitle">
                            <xsl:for-each select="ead:unittitle">
                                <xsl:choose>
                                    <xsl:when test="@label">
                                        <i>
                                        <b>
                                        <xsl:value-of select="@label"/>
                                        </b>
                                        </i>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <i>
                                        <b>
                                            <xsl:choose>
                                                <xsl:when
                                                    test="$language = 'eng' ">
                                                    <xsl:text>Contents: </xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:text>Inhoud: </xsl:text>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </b>
                                        </i>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:apply-templates/>
                                <br/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ead:abstract">
                            <xsl:for-each select="ead:abstract">
                                <xsl:choose>
                                    <xsl:when test="@label">
                                        <i>
                                            <b>
                                                <xsl:value-of select="@label"/>
                                            </b>
                                        </i>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <i>
                                            <b>
                                                <xsl:choose>
                                                    <xsl:when
                                                        test="$language = 'eng' ">
                                                        <xsl:text>Abstract: </xsl:text>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:text>Samenvatting: </xsl:text>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </b>
                                        </i>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:apply-templates/>
                                <br/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ead:origination">
                            <xsl:for-each select="ead:origination">
                                <xsl:choose>
                                    <xsl:when test="@label">
                                        <i>
                                        <b>
                                        <xsl:value-of select="@label"/>
                                        </b>
                                        </i>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:choose>
                                        <xsl:when test="$language = 'eng' ">
                                        <xsl:text>Provenance: </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        <xsl:text>Herkomst: </xsl:text>
                                        </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:apply-templates/>
                                <br/>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="ead:unitdate">
                            <xsl:for-each select="ead:unitdate">
                                <xsl:choose>
                                    <xsl:when test="@label">
                                        <i>
                                        <b>
                                        <xsl:value-of select="@label"/>
                                        </b>
                                        </i>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <i>
                                        <b>
                                        <xsl:choose>
                                        <xsl:when
                                        test="$language = 'eng' ">
                                        <xsl:text>Dates: </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        <xsl:text>Datering: </xsl:text>
                                        </xsl:otherwise>
                                        </xsl:choose>
                                        </b>
                                        </i>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:apply-templates/>
                                <br/>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="ead:physdesc">
                            <xsl:for-each select="ead:physdesc">
                                <xsl:choose>
                                    <xsl:when test="@label">
                                        <i>
                                        <b>
                                        <xsl:value-of select="@label"/>
                                        </b>
                                        </i>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <i>
                                        <b>
                                        <xsl:choose>
                                        <xsl:when
                                        test="$language = 'eng' ">
                                        <xsl:text>Form: </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        <xsl:text>Vorm: </xsl:text>
                                        </xsl:otherwise>
                                        </xsl:choose>
                                        </b>
                                        </i>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:apply-templates/>
                                <br/>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="ead:langmaterial">
                            <xsl:for-each select="ead:langmaterial">
                                <xsl:choose>
                                    <xsl:when test="@label">
                                        <i>
                                        <b>
                                        <xsl:value-of select="@label"/>
                                        </b>
                                        </i>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <i>
                                        <b>
                                        <xsl:choose>
                                        <xsl:when
                                        test="$language = 'eng' ">
                                        <xsl:text>Language: </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        <xsl:text>Taal: </xsl:text>
                                        </xsl:otherwise>
                                        </xsl:choose>
                                        </b>
                                        </i>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:apply-templates/>
                                <br/>
                            </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="ead:note">
                            <xsl:for-each select="ead:note">
                                <xsl:choose>
                                    <xsl:when test="@label">
                                        <i>
                                        <b>
                                        <xsl:value-of select="@label"/>
                                        </b>
                                        </i>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <i>
                                        <b>
                                        <xsl:choose>
                                        <xsl:when
                                        test="$language = 'eng' ">
                                        <xsl:text>Annotation: </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        <xsl:text>Annotatie: </xsl:text>
                                        </xsl:otherwise>
                                        </xsl:choose>
                                        </b>
                                        </i>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:apply-templates select="ead:p"/>
                                <br/>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:if test="ead:note">
                        <xsl:choose>
                            <xsl:when test="ead:note/ead:head">
                                <i>
                                    <b>
                                        <xsl:value-of select="ead:note/ead:head"/>
                                    </b>
                                </i>
                            </xsl:when>
                            <xsl:otherwise>
                                <i>
                                    <b>
                                        <xsl:choose>
                                        <xsl:when test="$language = 'eng' ">
                                        <xsl:text>Annotation: </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        <xsl:text>Annotatie: </xsl:text>
                                        </xsl:otherwise>
                                        </xsl:choose>
                                    </b>
                                </i>
                            </xsl:otherwise>
                        </xsl:choose>
                        <br/>
                        <xsl:for-each select="ead:note/ead:p">
                            <xsl:apply-templates select="."/>
                            <br/>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="ead:bioghist">
                        <xsl:for-each select="ead:bioghist">
                            <xsl:choose>
                                <xsl:when test="ead:head">
                                    <i>
                                        <b>
                                        <xsl:value-of select="ead:head"/>
                                        </b>
                                    </i>
                                </xsl:when>
                                <xsl:otherwise>
                                    <i>
                                        <b>
                                        <xsl:choose>
                                        <xsl:when
                                        test="$language = 'eng' ">
                                        <xsl:text>Historical context: </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        <xsl:text>Historische context: </xsl:text>
                                        </xsl:otherwise>
                                        </xsl:choose>
                                        </b>
                                    </i>
                                </xsl:otherwise>
                            </xsl:choose>
                            <br/>
                            <xsl:for-each select="*[local-name() != 'head' ]">
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="ead:scopecontent">
                        <xsl:for-each select="ead:scopecontent">


                                    <i>
                                        <b>

                                            <xsl:choose>
                                            <xsl:when test="ead:head">
                                                <xsl:value-of select="ead:head"/>
                                                <xsl:if test="string-length( ead:head ) &gt; 0 ">
                                                <xsl:element name="br"/>
                                                </xsl:if>
                                                </xsl:when>
                                            <xsl:when
                                                test="$language = 'eng' ">
                                                <xsl:text>Specification contents: </xsl:text>
                                                <xsl:element name="br"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:text>Specificatie inhoud: </xsl:text>
                                                <xsl:element name="br"/>
                                            </xsl:otherwise>
                                            </xsl:choose>
                                        </b>
                                    </i>

                            <xsl:for-each select="*[local-name() != 'head' ]">
                                <xsl:apply-templates select="."/>
                                <br/>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="ead:custodhist">
                        <xsl:for-each select="ead:custodhist">
                            <xsl:choose>
                                <xsl:when test="ead:head">
                                    <i>
                                        <b>
                                        <xsl:value-of select="ead:head"/>
                                        </b>
                                    </i>
                                </xsl:when>
                                <xsl:otherwise>
                                    <i>
                                        <b>
                                        <xsl:choose>
                                        <xsl:when
                                        test="$language = 'eng' ">
                                        <xsl:text>Custodial history: </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        <xsl:text>Herkomstgeschiedenis: </xsl:text>
                                        </xsl:otherwise>
                                        </xsl:choose>
                                        </b>
                                    </i>
                                </xsl:otherwise>
                            </xsl:choose>
                            <br/>
                            <xsl:for-each select="*[local-name() != 'head' ]">
                                <xsl:apply-templates select="."/>
                                <br/>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="ead:bibliography">
                        <xsl:for-each select="ead:bibliography">
                            <xsl:choose>
                                <xsl:when test="ead:head">
                                    <i>
                                        <b>
                                        <xsl:value-of select="ead:head"/>
                                        </b>
                                    </i>
                                </xsl:when>
                                <xsl:otherwise>
                                    <i>
                                        <b>
                                        <xsl:choose>
                                        <xsl:when
                                        test="$language = 'eng' ">
                                        <xsl:text>Literature: </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                        <xsl:text>Literatuur: </xsl:text>
                                        </xsl:otherwise>
                                        </xsl:choose>
                                        </b>
                                    </i>
                                </xsl:otherwise>
                            </xsl:choose>
                            <br/>
                            <xsl:element name="table">
                                <xsl:attribute name="width">
                                    <xsl:text>100%</xsl:text>

                                </xsl:attribute>


                                <xsl:for-each select="*[local-name() != 'head' ]">
                                    <xsl:apply-templates select="."/>
                                </xsl:for-each>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:apply-templates select="ead:did/ead:dao"/>
                </xsl:element>

            </xsl:element>
            <xsl:if test="ead:did/ead:daogrp">
                <xsl:element name="tr">

                    <xsl:element name="td">
                        <xsl:attribute name="colspan">
                            <xsl:text>2</xsl:text>
                        </xsl:attribute>


                            <xsl:element name="hr"/>
                    </xsl:element>

                </xsl:element>
            </xsl:if>
        </xsl:element>
    </xsl:template>


    <xsl:template name="series">
        <xsl:if test="@id">
            <a>
                <xsl:attribute name="name">
                    <xsl:value-of select="@id"/>
                </xsl:attribute>
            </a>
        </xsl:if>
        <xsl:variable name="name">
            <xsl:value-of select="local-name()"/>
        </xsl:variable>
        <xsl:for-each select="ead:did">
            <xsl:choose>
                <xsl:when test="$name = 'c01' ">

                    <br/>
                    <h3>
                        <xsl:if test="ead:unitid">
                            <xsl:apply-templates select="ead:unitid"/>
                            <xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;</xsl:text>
                        </xsl:if>
                        <xsl:apply-templates select="ead:unittitle"/>
                    </h3>
                </xsl:when>
                <xsl:otherwise>
                    <p>
                        <b>
                            <xsl:if test="ead:unitid">
                                <xsl:apply-templates select="ead:unitid"/>
                                <xsl:text>&#160;&#160;&#160;&#160;&#160;&#160;</xsl:text>
                            </xsl:if>
                            <xsl:apply-templates select="ead:unittitle"/>
                        </b>
                    </p>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>

        <xsl:choose>
            <xsl:when test="ead:did/ead:daogrp">

 <xsl:element name="table">

     <xsl:element name="tr">
         <xsl:element name="td">
             <xsl:attribute name="width">
                 <xsl:text>21%</xsl:text>
             </xsl:attribute>
             <xsl:attribute name="valign">
                 <xsl:text>top</xsl:text>
             </xsl:attribute>

             <xsl:element name="br"/>
                 <xsl:element name="a">
                     <xsl:attribute name="href">
                         <xsl:value-of select="ead:did/ead:daogrp/ead:daoloc[ @label= 'reference' ]/@href"/>
                     </xsl:attribute>

                     <xsl:attribute name="target">
                         <xsl:text>_blank</xsl:text>
                     </xsl:attribute>

                     <xsl:if test="ead:did/ead:daogrp/ead:daoloc[ @label= 'thumbnail' ] ">
                         <xsl:element name="img">
                             <xsl:attribute name="src">
                                 <xsl:value-of
                                     select="ead:did/ead:daogrp/ead:daoloc[ @label= 'thumbnail' ]/@href"/>
                             </xsl:attribute>
                             <xsl:attribute name="width">
                                 <xsl:text>75</xsl:text>
                             </xsl:attribute>
                             <xsl:attribute name="border">
                                 <xsl:text>0</xsl:text>
                             </xsl:attribute>
                         </xsl:element>
                     </xsl:if>
                 </xsl:element>





         </xsl:element>
         <xsl:element name="td">

             <xsl:call-template name="series-contents"/>
         </xsl:element>

     </xsl:element>

 </xsl:element>




            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="series-contents"/>

            </xsl:otherwise>

        </xsl:choose>


    </xsl:template>


    <xsl:template match="ead:descgrp//ead:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template name="series-contents">

        <xsl:for-each select="ead:did">
        <xsl:if test="ead:origination">
            <xsl:for-each select="ead:origination">
                <b>
                    <i>
                        <xsl:choose>
                            <xsl:when test="@label">
                                <i>
                                    <b>
                                        <xsl:value-of select="@label"/>
                                    </b>
                                </i>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:choose>
                                    <xsl:when test="$language = 'eng' ">
                                        <xsl:text>Provenance: </xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>Herkomst: </xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                        <br/>
                    </i>
                </b>
                <xsl:apply-templates/>
            </xsl:for-each>
        </xsl:if>

        <xsl:if test="ead:abstract">
            <xsl:for-each select="ead:abstract">
                <b>
                    <i>
                        <xsl:choose>
                            <xsl:when test="@label">
                                <xsl:value-of select="@label"/>
                            </xsl:when>

                            <xsl:when test="$language = 'eng' ">
                                <xsl:text>Abstract: </xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>Samenvatting </xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </i>
                </b>
                <xsl:apply-templates/>
                <xsl:element name="br"/>
            </xsl:for-each>
        </xsl:if>

        <xsl:if test="ead:unitdate">
            <xsl:for-each select="ead:unitdate">
                <i>
                    <b>
                        <xsl:choose>
                            <xsl:when test="@label">
                                <xsl:value-of select="@label"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>Datering: </xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </b>
                </i>
                <xsl:apply-templates select="."/>
                <br/>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="ead:note">
            <xsl:for-each select="ead:note">
                <i>
                    <b>
                        <xsl:choose>
                            <xsl:when test="@label">
                                <xsl:value-of select="@label"/>
                            </xsl:when>
                            <xsl:when test="$language = 'eng' ">
                                <xsl:text>Note: </xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>Annotatie: </xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </b>
                </i>
                <xsl:for-each select="*">
                    <xsl:apply-templates select="."/>
                    <br/>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="ead:physdesc">
            <xsl:for-each select="ead:physdesc">
                <i>
                    <b>
                        <xsl:choose>
                            <xsl:when test="@label">
                                <xsl:value-of select="@label"/>
                            </xsl:when>
                            <xsl:when test="$language = 'eng' ">
                                <xsl:text>Form: </xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>Vorm: </xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </b>
                </i>
                <xsl:apply-templates select="."/>
                <br/>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="ead:dao">
            <xsl:element name="div">
                <xsl:attribute name="id">
                    <xsl:text>dsc</xsl:text>
                </xsl:attribute>
            </xsl:element>
        </xsl:if>
        </xsl:for-each>
        <xsl:if test="ead:scopecontent">
            <xsl:for-each select="ead:scopecontent">
                <i>
                    <b>
                        <xsl:choose>
                            <xsl:when test="ead:head">
                                <xsl:value-of select="ead:head"/>
                                <xsl:if test="string-length( ead:head ) &gt; 1">
                                    <xsl:element name="br"/>
                                </xsl:if>

                            </xsl:when>
                            <xsl:when
                                test="$language = 'eng' ">
                                <xsl:text>Specification contents: </xsl:text>      <br/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>Specificatie inhoud: </xsl:text>      <br/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </b>
                </i>

                <xsl:for-each select="*[local-name() != 'head' ]">
                    <xsl:apply-templates select="."/>
                    <br/>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="ead:bioghist">
            <xsl:for-each select="ead:bioghist">
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <i>
                            <b>
                                <xsl:value-of select="ead:head"/>
                            </b>
                        </i>
                    </xsl:when>
                    <xsl:otherwise>
                        <i>
                            <b>Historische context: </b>
                        </i>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:for-each select="*[local-name() != 'head' ]">
                    <xsl:apply-templates select="."/>
                    <br/>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="ead:custodhist">
            <xsl:for-each select="ead:custodhist">
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <i>
                            <b>
                                <xsl:value-of select="ead:head"/>
                            </b>
                        </i>
                    </xsl:when>
                    <xsl:otherwise>
                        <i>
                            <b>Herkomstgeschiedenis: </b>
                        </i>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:for-each select="*[local-name() != 'head' ]">
                    <xsl:apply-templates select="."/>
                    <br/>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:if>
        <xsl:if test="ead:bibliography">
            <xsl:for-each select="ead:bibliography">
                <xsl:choose>
                    <xsl:when test="ead:head">
                        <i>
                            <b>
                                <xsl:value-of select="ead:head"/>
                            </b>
                        </i>
                    </xsl:when>
                    <xsl:otherwise>
                        <i>
                            <b>Literatuur: </b>
                        </i>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:element name="table">
                    <xsl:attribute name="width">
                        <xsl:text>100%</xsl:text>

                    </xsl:attribute>


                    <xsl:for-each select="*[local-name() != 'head' ]">
                        <xsl:apply-templates select="."/>
                    </xsl:for-each>
                </xsl:element>


            </xsl:for-each>
            </xsl:if>

    </xsl:template>


</xsl:stylesheet>
