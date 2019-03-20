<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />
    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="UTF-8" />
                <title>Caja Puerto - Información Sucursales</title>
                <link rel="stylesheet" type="text/css" href="cajaPuerto.css" />
            </head>
            <body>
                <h1>Sucursales</h1>
                <br />
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>
    <xsl:template match="sucursal">
        <h2>
            Info Sucursal
            <xsl:value-of select="@codigo_suc" />
        </h2>
        <ul>
            <h3>Clientes</h3>
            <ol>
                <xsl:for-each select="clientes/cliente">
                    <br />
                    <div class="dropdown">
                        <h4 class="dropbtn">Mostrar</h4>
                        <table class="dropdown-content">
                            <tr>
                                <th>Apellido</th>
                                <th>Nombre</th>
                                <th>DNI</th>
                                <th>Teléfono</th>
                            </tr>
                            <tr>
                                <td>
                                    <xsl:value-of select="nombre/apellido" />
                                </td>
                                <td>
                                    <xsl:value-of select="nombre/nombre" />
                                </td>
                                <td>
                                    <xsl:value-of select="dni" />
                                </td>
                                <td>
                                    <xsl:value-of select="telefono" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </xsl:for-each>
            </ol>
            <hr />
            <h3>Cuentas</h3>
            <ol>
                <xsl:for-each select="cuentas/cuenta">
                    <br />
                    <table>
                        <tr>
                            <th>Código</th>
                            <th>Propietario</th>
                            <th>Saldo</th>
                            <th>Privilegios</th>
                        </tr>
                        <tr>
                            <td>
                                <xsl:value-of select="@codigo" />
                            </td>
                            <td>
                                <xsl:value-of select="cod_cliente" />
                            </td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="saldo &gt; 12000">
                                        <input text="Saldo" value="{saldo}" style="color: green" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <input text="Saldo" value="{saldo}" style="color: red" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td>
                                <xsl:value-of select="privilegios" />
                            </td>
                        </tr>
                    </table>
                </xsl:for-each>
            </ol>
            <hr />
            <h3>Préstamos</h3>
            <ol>
                <xsl:for-each select="prestamos/prestamo">
                    <br />
                    <table>
                        <tr>
                            <th>Cliente</th>
                            <th>Cantidad</th>
                            <th>Comisión</th>
                            <th>Plazo</th>
                        </tr>
                        <tr>
                            <td>
                                <xsl:value-of select="NIFcliente" />
                            </td>
                            <td>
                                <xsl:value-of select="cantidad" />
                            </td>
                            <td>
                                <xsl:value-of select="comision" />
                            </td>
                            <!--La entidad que suple al espacio debe ir pegada a las etiquetas que se quieren separar-->
                            <td>
                                <xsl:value-of select="plazo_pago/@numero" />
                                &#160;
                                <xsl:value-of select="plazo_pago/@plazo" />
                            </td>
                        </tr>
                    </table>
                </xsl:for-each>
            </ol>
        </ul>
    </xsl:template>
</xsl:stylesheet>
