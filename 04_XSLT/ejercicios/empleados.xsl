<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- con el xsl template le decimos donde queremos situarnos dentro del arbol dom 
, con "/" decimos que queremos situarnos en el nodo raiz o "document"
-->
    <xsl:template match="/">
        <html>
            <head>
                <title>Lista Empleados</title>
               
                <link rel="stylesheet" href="empleados.css" />
            </head>
            <body>
                <!-- Con esta etiqueta (value-of select) seleccionamos el texto del nodo que queramos -->
                <h1>
                    <xsl:value-of select="empresa/nombre" />
                </h1>

                <!-- Este select me va a devolver TODOS los nodos empleado, como queremos
                obtner cada uno de los nodos, mejor manera sería con un for-each ya que
                recoore todos los nodos 
                -->
                <xsl:for-each select="empresa/empleados/empleado">
                    <p>
                        <!-- Ahora la ruta para acceder al destion cambia de manera relativa -->
                        Numero de Empleado:
                        <xsl:value-of select="@numero_empleado" />
                        <br />
                        Nombre:
                        <xsl:value-of select="nombre" />
                        <br />
                        Apellidos:
                        <xsl:value-of select="apellidos" />
                        <br />
                        Puesto:
                        <xsl:value-of select="puesto" />
                        <br />
                        Permanencia:
                        <xsl:value-of select="permanencia/@tiempo" />
                        <br />
                        Salario:
                        <xsl:value-of select="salario" />
                        <br />
                        <xsl:if test="hora_extra &gt; 0">
                            <br />
                            Horas Extras:
                            <xsl:value-of select="hora_extra" />
                        </xsl:if>
                        <br />
                        
                        <!-- De manera relativa al select del for-each accedemos a los
                        proyecto -->
                        <xsl:for-each select="proyectos/proyecto">
                            Proyecto:<xsl:value-of select="nombre" />
                            <br />    
                        </xsl:for-each>
                       
                        <xsl:if test="permanencia/@tiempo &gt; 5">
                            <br />
                            Por llevar más de 5 años en la empresa el empleado es Senior
                        </xsl:if>
                    </p>                    
                </xsl:for-each> <!-- Fin de for each empleados/empleado-->

                <table border="2">
                    <tr>
                        <th>Nombre de la Empresa</th>
                        <th>Fecha constitución</th>
                        <th>Ceo</th>
                    </tr>
                        <tr>
                            <!-- Con arroba (@) accedemos a atributos -->
                            <td>
                                <xsl:value-of select="empresa/nombre" />
                            </td>
                            <td>
                                <xsl:value-of select="empresa/fecha_constitucion" />
                            </td>
                            <td>
                                <xsl:value-of select="empresa/ceo_director" />
                            </td>
                            
                        </tr>
                </table>                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>