<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CadComerWebsite.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins"/>
<link rel="stylesheet" href="Default.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="width: 100vw; height: 100vh">
        <div style="width: 100%; height: 100%; background-color: #D0E7D2;">
            <div style="width: 20%;position: absolute;top: 10%;left: 50%;transform: translate(-50%, -50%);text-align: center;border-bottom: 2px solid #618264;padding: 0.5%;font-size: 175%;font-weight: bold;font-family: 'Poppins';color: #618264;">
                Menú de consultas
            </div>
            <div style="width: 80%;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);text-align: center;font-size: 150%;font-family: 'Poppins';color: #618264;">
                <asp:Table ID="Table1" runat="server" style="width: 100%;">
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server">
                            <div class="nuevoBotón"><asp:HyperLink ID="LinkTarea4" runat="server" NavigateUrl="~/EF/ConsultasTarea4.aspx">Consultas de la tarea 4</asp:HyperLink></div>
                        
</asp:TableCell>
                        <asp:TableCell runat="server">
                            <div class="nuevoBotón"><asp:HyperLink ID="LinkConsComp" runat="server" NavigateUrl="~/EF/ConsultaComprasDesde.aspx">Consulta compras por cliente desde cierta fecha</asp:HyperLink></div>
                        
</asp:TableCell>
                        <asp:TableCell runat="server">
                            <div class="nuevoBotón"><asp:HyperLink ID="LinkRegisComp" runat="server" NavigateUrl="~/EF/RegistrarCompra.aspx">Registra Compra</asp:HyperLink></div>
                        
</asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow runat="server">
                        <asp:TableCell runat="server"></asp:TableCell>
                        <asp:TableCell runat="server"></asp:TableCell>
                        <asp:TableCell runat="server"></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </form>
</body>
</html>
