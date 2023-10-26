<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultasTarea4.aspx.cs" Inherits="CadComerWebsite.EF.ConsultasTarea4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="background-color: #D0E7D2; height: 634px;">
            <asp:HyperLink ID="LinkInicio" runat="server" ForeColor="#618264" NavigateUrl="~/Default.aspx" style="z-index: 1; left: 38px; top: 603px; position: absolute">Volver al inicio</asp:HyperLink>
            <asp:Label ID="Title" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#618264" style="z-index: 1; left: 636px; top: 31px; position: absolute" Text="Consultas de la tarea 4"></asp:Label>
            <asp:LinkButton ID="BtnCons1" runat="server" ForeColor="#618264" OnClick="BtnCons1_Click" style="z-index: 1; left: 74px; top: 129px; position: absolute; height: 37px; width: 423px">Nombre de los clientes cuyo saldo global es menor al 10% del monto total de los artículos que compraron en cadena a especificar</asp:LinkButton>
            <asp:GridView ID="GrdRes" runat="server" ForeColor="#618264" style="z-index: 1; left: 1077px; top: 128px; position: absolute; height: 133px; width: 187px" EmptyDataText="No hay datos">
            </asp:GridView>
            <asp:LinkButton ID="BtnCons2" runat="server" ForeColor="#618264" OnClick="BtnCons2_Click" style="z-index: 1; left: 74px; top: 204px; position: absolute; height: 40px; width: 350px">Nombre de los clientes que no han hecho compras este mes y nombre de las cadenas donde tienen crédito</asp:LinkButton>
            <asp:LinkButton ID="BtnCons3" runat="server" ForeColor="#618264" OnClick="BtnCons3_Click" style="z-index: 1; left: 79px; top: 281px; position: absolute; height: 43px; width: 322px">Nombre de sucursales y monto total de ventas, que sea menor a $50,000, del mes pasado por cadena.</asp:LinkButton>
            <asp:LinkButton ID="BtnCons4" runat="server" ForeColor="#618264" OnClick="BtnCons4_Click" style="z-index: 1; left: 79px; top: 353px; position: absolute; height: 42px; width: 306px">Nombre y domicilio de suscursales de la cadena con mayor número de estas</asp:LinkButton>
            <asp:Label ID="CadenaCons" runat="server" ForeColor="#618264" style="z-index: 1; left: 662px; top: 140px; position: absolute; " Text="Cadena:" Enabled="False" Visible="False"></asp:Label>
            <asp:Label ID="Intruc" runat="server" Font-Bold="True" ForeColor="#618264" style="z-index: 1; left: 42px; top: 73px; position: absolute; right: 1231px; height: 21px" Text="Haz click en alguna liga para comenzar:"></asp:Label>
            <asp:Label ID="MsjErr" runat="server" ForeColor="#618264" style="z-index: 1; left: 667px; top: 274px; position: absolute; right: 762px" Enabled="False" Visible="False"></asp:Label>
            <asp:Label ID="Indx1" runat="server" Font-Bold="True" ForeColor="#618264" style="z-index: 1; left: 51px; top: 205px; position: absolute; height: 31px; width: 39px" Text="2)"></asp:Label>
            <asp:Label ID="Indx2" runat="server" Font-Bold="True" ForeColor="#618264" style="z-index: 1; left: 49px; top: 126px; position: absolute; height: 31px; width: 39px" Text="1)"></asp:Label>
            <asp:Label ID="Indx3" runat="server" Font-Bold="True" ForeColor="#618264" style="z-index: 1; left: 52px; top: 280px; position: absolute; height: 31px; width: 39px" Text="3)"></asp:Label>
            <asp:Label ID="Indx4" runat="server" Font-Bold="True" ForeColor="#618264" style="z-index: 1; left: 52px; top: 353px; position: absolute; height: 31px; width: 39px" Text="4)"></asp:Label>
            <asp:DropDownList ID="DdlNomCad" runat="server" AutoPostBack="True" style="z-index: 1; left: 750px; top: 139px; position: absolute" Enabled="False" Visible="False">
            </asp:DropDownList>
            <asp:Button ID="BtnEject" runat="server" style="z-index: 1; left: 662px; top: 191px; position: absolute" Text="Ejecutar" Enabled="False" OnClick="BtnEject_Click1" Visible="False" />
            <asp:Label ID="RsltTxt" runat="server" ForeColor="#618264" style="z-index: 1; left: 1074px; top: 93px; position: absolute" Text="En espera"></asp:Label>
        </div>
    </form>
</body>
</html>
