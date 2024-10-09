<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmUbicaciones.aspx.cs" Inherits="Crut_Ubicacion_JACR.frmUbicaciones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyDlv2PNwLztXH4VUYD9J9jW5vuv-T6YzRs'></script>
    <script src="js/locationpicker.jquery.js"></script>
    <title>Control de ubicaciones</title>
</head>
    <body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="exampleInputEmaill">Ubicación</label>
                        <asp:HiddenField ID="txtID" runat="server"/>
                        <asp:TextBox ID="txtUbicacion" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <div id="ModalMapPreview" style="width:100%; height: 300px;"></div>
                    </div>
                    <!-- LAtitud y Longitud -->
                    <div class="form-group">
                        <label for="ExampleInputPassword1">Lat.:</label>
                        <asp:TextBox ID="txtLat" Text="27.368014548143854" CssClass="form-control" runat="server"></asp:TextBox>
                        <label for="ExampleInputPassword1">Long:</label>
                        <asp:TextBox ID="txtLong" Text="-109.93262430418584" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <!-- Controles de altas, bajas y cambios -->
                        
                    <div class="form-group">
                        <asp:Button ID="btnAgregar" CssClass="btn btn-success" runat="server" Text="Agregar" UseSubmitBehavior="false" OnClick="AgregarRegistro" EnableTheming="True"/>
                        <asp:Button ID="btnModificar" CssClass="btn btn-warning" runat="server" Text="Modificar" UseSubmitBehavior="false" OnClick="ModificarRegistro"/>
                        <asp:Button ID="btnEliminar" CssClass="btn btn-danger" runat="server" Text="Eliminar" UseSubmitBehavior="false" OnClick="EliminarRegistro"/>
                        <asp:Button ID="btnLimpiar" CssClass="btn btn-default" runat="server" Text="Limpiar" UseSubmitBehavior="false"/>

                    </div>
                </div>
                <div class="col-md-8">
                    <br />
                    <h1>Ubicación</h1>
                    <asp:GridView ID="gvUbicaciones" runat="server" CssClass="table-reposetive table table-border" EnableTheming="True" OnRowCommand="SeleccionarRegistro">
                        <Columns>
                            <asp:ButtonField CommandName="btnSeleccionar" Text="Selecionar">
                            <ControlStyle CssClass="btn btn-info" />
                            </asp:ButtonField>
                        </Columns>
                    </asp:GridView>

                </div>

                

            </div>
        </div>
    <script>
        $('#ModalMapPreview').locationpicker({
            radius: 0,
            location: {
                latitude: $('#<%=txtLat.ClientID%>').val(),
                longitude: $('#<%=txtLong.ClientID%>').val(),
            },
            inputBinding: {
                latitudeInput: $('#<%=txtLat.ClientID%>'),
                longitudeIntup: $('#<%=txtLong.ClientID%>'),
                locationNameInput: $('#<%=txtUbicacion.ClientID%>')
            },
            enableAutocomplete: true
        });
    </script>
        
    </form>
    </body>
</html>