<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComprasClienteFecha.aspx.cs" Inherits="CadComerWebsite.EF.ComprasClienteFecha" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="background-color: #D0E7D2; height: 634px;">
            <asp:Button ID="BtnEject" runat="server" style="z-index: 1; left: 96px; top: 485px; position: absolute" Text="Ejecutar" />
            <asp:HyperLink ID="LinkInicio" runat="server" ForeColor="#618264" NavigateUrl="~/Default.aspx" style="z-index: 1; left: 38px; top: 603px; position: absolute">Volver al inicio</asp:HyperLink>
            <asp:Label ID="Title" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#618264" style="z-index: 1; left: 455px; top: 41px; position: absolute" Text="Compras hechas por cliente a partir de fecha dada"></asp:Label>
            <asp:Label ID="LblClli" runat="server" ForeColor="#618264" style="z-index: 1; left: 89px; top: 163px; position: absolute" Text="Cliente: "></asp:Label>
            <asp:DropDownList ID="DdlCliente" runat="server" AutoPostBack="True" style="z-index: 1; left: 173px; top: 160px; position: absolute">
            </asp:DropDownList>
            <asp:Label ID="Instruc" runat="server" Font-Size="Large" ForeColor="#618264" style="z-index: 1; left: 695px; top: 93px; position: absolute" Text="Llena los datos y haz click en ejecutar."></asp:Label>
            <asp:Label ID="MsjErr" runat="server" Font-Size="Large" ForeColor="#618264" style="z-index: 1; left: 220px; top: 489px; position: absolute"></asp:Label>
            <asp:Label ID="LblFecha" runat="server" ForeColor="#618264" style="z-index: 1; left: 90px; top: 243px; position: absolute" Text="Fecha: "></asp:Label>
            <asp:Calendar ID="ClndrFecha" runat="server" ForeColor="#618264" style="z-index: 1; left: 163px; top: 239px; position: absolute; height: 188px; width: 259px"></asp:Calendar>
            <asp:GridView ID="GridView1" runat="server" ForeColor="#618264" style="z-index: 1; left: 696px; top: 198px; position: absolute; height: 133px; width: 187px">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
