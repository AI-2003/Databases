<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CadComerWebsite.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Menú</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="background-color: #D0E7D2; height: 634px;">
            <asp:Label ID="Subtitle" runat="server" Font-Size="Large" ForeColor="#618264" style="z-index: 1; left: 485px; top: 286px; position: absolute" Text="En este sitio podrás consultar y registrar información acerca de las cadenas comerciales."></asp:Label>
            <asp:Label ID="Instruction" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#618264" style="z-index: 1; left: 627px; top: 333px; position: absolute" Text="Haz clic en algún elemento del menú para continuar."></asp:Label>
            <asp:Label ID="Title" runat="server" Font-Bold="True" Font-Names="Arial Black" Font-Size="XX-Large" ForeColor="#618264" style="z-index: 1; left: 646px; top: 205px; position: absolute; height: 38px; width: 322px" Text="Cadena Comercial"></asp:Label>
            <asp:HyperLink ID="LinkConsTarea4" runat="server" ForeColor="#618264" NavigateUrl="~/EF/ConsultasTarea4.aspx" style="z-index: 1; left: 46px; top: 38px; position: absolute">Consultas de la tarea 4</asp:HyperLink>
            <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#618264" NavigateUrl="~/EF/ComprasClienteFecha.aspx" style="z-index: 1; left: 702px; top: 41px; position: absolute">Compras por cliente desde fecha</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" ForeColor="#618264" NavigateUrl="~/EF/RegistroCompra.aspx" style="z-index: 1; left: 1397px; top: 44px; position: absolute">Registrar compra</asp:HyperLink>
        </div>
    </form>
</body>
</html>
