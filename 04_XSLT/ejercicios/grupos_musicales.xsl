<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/"> 
    <!-- El / quiere decir que empieza el origen del arbol
    Con el xsl template le decimos donde queremos situarnos
    dentro del arbol don, con "/" decimos que queremos situarnos 
    en el directorio raiz o "document"
    -->    
        <html>
            <head>
                <title>GRUPOS MUSICALES</title>
            </head>
            <body>
                <h2><xsl:value-of select="grupos_musicales/titulo"/></h2>
                <hr/>
                <xsl:for-each select="grupos_musicales/grupo">
                    <h3>GRUPO</h3>
                    <table border="2" cellspacing="15" cellspadding="600">
                        <thead>
                            <tr>
                                <th>NOMBRE GRUPO</th>
                                <th>GENERO</th>
                                <th>PAIS</th>
                                <th>AÑO</th>
                                <th>ACTIVO</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><xsl:value-of select="nombre_grupo"/></td>
                                <td><xsl:value-of select="genero"/></td>   
                                <td><xsl:value-of select="pais"/></td>
                                <td><xsl:value-of select="anio_formacion"/></td>  
                                <xsl:if test="estado_activo = 1">
                                    <td>SI</td>
                                </xsl:if>
                                <xsl:if test="estado_activo = 0">
                                    <td>NO</td> 
                                </xsl:if>
                            </tr>
                        </tbody>
                    </table>
                    <hr/>
                    <table border="1" cellspacing="5" cellspadding="20">
                        <thead>
                            <tr>
                                <th>INTEGRANTES</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="integrantes/nombre">
                                <tr>
                                    <!-- Si quereis seleccionar el valor de un nodo propio podeis
                                    usar el "." -->
                                    <td><xsl:value-of select="."/></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                    <br/>
                    <hr/>
                    <table border="1">
                        <thead>
                            <tr>
                                <th colspan="2">DISCOGRAFIA</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:for-each select="album">
                                <tr>
                                    <td><h4>Album</h4></td>
                                    <td><xsl:value-of select="nombre"/></td>
                                </tr>
                                <tr>
                                    <td><h4>Discográfica</h4></td>                        
                                    <td><xsl:value-of select="discografica"/></td>
                                </tr>
                                <tr>
                                    <td><h4>Año de debut</h4></td>                        
                                    <td><xsl:value-of select="anio"/></td>
                                </tr>
                                <xsl:for-each select="canciones/cancion">
                                    <tr>
                                        <td><h4>Canciones</h4></td> 
                                        <td><xsl:value-of select="."/></td>
                                    </tr>
                                </xsl:for-each>                        
                            </xsl:for-each>
                        </tbody>
                    </table>
                    <br/><hr size ="12" color="blue"/>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>