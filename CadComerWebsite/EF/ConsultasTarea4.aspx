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
            <asp:Label ID="NumConsARealizar" runat="server" ForeColor="#618264" style="z-index: 1; left: 845px; top: 138px; position: absolute; width: 48px; bottom: 513px" Text="1"></asp:Label>
            <asp:LinkButton ID="BtnCons1" runat="server" ForeColor="#618264" OnClick="BtnCons1_Click" style="z-index: 1; left: 74px; top: 129px; position: absolute; height: 37px; width: 423px">Nombre de los clientes cuyo saldo global es menor al 10% del monto total de los artículos que compraron en cadena a especificar</asp:LinkButton>
            <asp:GridView ID="GrdRes" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" style="z-index: 1; left: 1077px; top: 128px; position: absolute; height: 133px; width: 187px">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:LinkButton ID="BtnCons2" runat="server" ForeColor="#618264" OnClick="BtnCons2_Click" style="z-index: 1; left: 74px; top: 204px; position: absolute; height: 40px; width: 350px">Nombre de los clientes que no han hecho compras este mes y nombre de las cadenas donde tienen crédito</asp:LinkButton>
            <asp:LinkButton ID="BtnCons3" runat="server" ForeColor="#618264" OnClick="BtnCons3_Click" style="z-index: 1; left: 79px; top: 281px; position: absolute; height: 43px; width: 322px">Nombre de sucursales y monto total de ventas, que sea menor a $50,000, del mes pasado por cadena.</asp:LinkButton>
            <asp:LinkButton ID="BtnCons4" runat="server" ForeColor="#618264" OnClick="BtnCons4_Click" style="z-index: 1; left: 79px; top: 353px; position: absolute; height: 42px; width: 306px">Nombre y domicilio de suscursales de la cadena con mayor número de estas</asp:LinkButton>
            <asp:Label ID="CadenaCons" runat="server" ForeColor="#618264" style="z-index: 1; left: 661px; top: 195px; position: absolute; right: 768px" Text="Cadena:"></asp:Label>
            <asp:Label ID="Intruc" runat="server" Font-Bold="True" ForeColor="#618264" style="z-index: 1; left: 42px; top: 73px; position: absolute; right: 1231px; height: 21px" Text="Haz click en alguna liga para comenzar:"></asp:Label>
            <asp:Label ID="MsjErr" runat="server" ForeColor="#618264" style="z-index: 1; left: 709px; top: 321px; position: absolute; right: 720px"></asp:Label>
            <asp:Label ID="Indx1" runat="server" Font-Bold="True" ForeColor="#618264" style="z-index: 1; left: 51px; top: 205px; position: absolute; height: 31px; width: 39px" Text="2)"></asp:Label>
            <asp:Label ID="Indx2" runat="server" Font-Bold="True" ForeColor="#618264" style="z-index: 1; left: 49px; top: 126px; position: absolute; height: 31px; width: 39px" Text="1)"></asp:Label>
            <asp:Label ID="Indx3" runat="server" Font-Bold="True" ForeColor="#618264" style="z-index: 1; left: 52px; top: 280px; position: absolute; height: 31px; width: 39px" Text="3)"></asp:Label>
            <asp:Label ID="Indx4" runat="server" Font-Bold="True" ForeColor="#618264" style="z-index: 1; left: 52px; top: 353px; position: absolute; height: 31px; width: 39px" Text="4)"></asp:Label>
            <asp:DropDownList ID="DdlNomCad" runat="server" AutoPostBack="True" style="z-index: 1; left: 813px; top: 196px; position: absolute">
            </asp:DropDownList>
            <asp:Button ID="BtnEject" runat="server" style="z-index: 1; left: 731px; top: 263px; position: absolute" Text="Ejecutar" />
            <asp:Label ID="ConsPorRealizar2" runat="server" ForeColor="#618264" style="z-index: 1; left: 691px; top: 137px; position: absolute; right: 738px" Text="Consulta a realizar: "></asp:Label>
        </div>
    </form>
</body>
</html>
