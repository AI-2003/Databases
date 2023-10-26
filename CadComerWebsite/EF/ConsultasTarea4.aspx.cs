using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity; // Siempre se debe de importar para usar el EF.
using System.Security.Cryptography;

namespace CadComerWebsite.EF
{
    public class NombreCliente
    {
        public string Nombre { get; set; }
    }

    public class ClienteCadena
    {
        public string NombreCliente { get; set; }
        public string NombreCadena { get; set; }
    }

    public class VentaSucursal
    {
        public string NombreCadena { get; set; }
        public string NombreSucursal { get; set; }
        public double VentasTotales { get; set; }

    }
    public class DomicilioSucursal
    {
        public string Cadena { get; set; }
        public string Sucursal { get; set; }
        public string Domicilio { get; set; }

    }


    public partial class ConsultasTarea4 : System.Web.UI.Page
    {
        CadComerEntities1 context = new CadComerEntities1();
        String cadSql;
        List<Cadena> lsCadenas; List<NombreCliente> lsNombres; List<ClienteCadena> lsClientesCadenas; List<VentaSucursal> lsVentasSucursales; List<DomicilioSucursal> lsDomiciliosSucursales;



        public void desactivaControles()
        {
            // Ocultamos el selector de cadena de la consulta 1
            CadenaCons.Visible = false; CadenaCons.Enabled = false;
            DdlNomCad.Visible = false; DdlNomCad.Enabled = false;
            BtnEject.Visible = false; BtnEject.Enabled = false;
            MsjErr.Visible = false; MsjErr.Enabled = false;
        }

        public void activaControles()
        {
            // Mostramos el selector de cadena de la consulta 1
            CadenaCons.Visible = true; CadenaCons.Enabled = true;
            DdlNomCad.Visible = true; DdlNomCad.Enabled = true;
            BtnEject.Visible = true; BtnEject.Enabled = true;
            MsjErr.Visible = true; MsjErr.Enabled = true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void BtnCons1_Click(object sender, EventArgs e)
        {
            activaControles();

            // Leer las cadenas y carga los nombres en el ddl
            cadSql = $"select * from Cadena";
            lsCadenas = context.Cadena.SqlQuery(cadSql).ToList();
            DdlNomCad.Items.Clear();
            DdlNomCad.Items.Add(" ");
            foreach (Cadena c in lsCadenas)
            {
                DdlNomCad.Items.Add(c.Nombre);
            }
        }
        protected void BtnCons2_Click(object sender, EventArgs e)
        {
            cadSql = "SELECT C.Nombre AS NombreCliente, CA.Nombre AS NombreCadena " +
                "FROM Cliente C " +
                "LEFT JOIN Registro R ON C.IdC = R.IdC " +
                "LEFT JOIN Cadena CA ON R.RFC = CA.RFC " +
                "WHERE C.IdC NOT IN(" +
                "  SELECT DISTINCT F.IdC " +
                "  FROM Factura F " +
                "  WHERE MONTH(F.Fecha) = MONTH(GETDATE()) " +
                ") " +
                "OR R.RFC IS NOT NULL; ";
            lsClientesCadenas = context.Database.SqlQuery<ClienteCadena>(cadSql).ToList();
            GrdRes.DataSource = lsClientesCadenas;
            GrdRes.DataBind();
            RsltTxt.Text = "Resultado de consulta 2";
        }

        protected void BtnCons3_Click(object sender, EventArgs e)
        {
            cadSql = "SELECT " +
            "    c.Nombre AS NombreCadena, " +
            "    s.Nombre AS NombreSucursal, " +
            "    SUM(f.MontoT) AS VentasTotales " +
            "FROM " +
            "    Cadena c " +
            "JOIN " +
            "    Sucursal s ON c.RFC = s.RFC " +
            "JOIN " +
            "    Factura f ON s.IdS = f.IdS " +
            "WHERE " +
            "    MONTH(f.Fecha) = MONTH(GETDATE())-1 " +
            "    AND YEAR(f.Fecha) = YEAR(GETDATE())" +
            "GROUP BY " +
            "    c.Nombre, s.Nombre " +
            "HAVING " +
            "    SUM(f.MontoT) < 50000;";
            lsVentasSucursales = context.Database.SqlQuery<VentaSucursal>(cadSql).ToList();
            GrdRes.DataSource = lsVentasSucursales;
            GrdRes.DataBind();
            RsltTxt.Text = "Resultado de consulta 3";
        }

        protected void BtnCons4_Click(object sender, EventArgs e)
        { 
            cadSql = "SELECT  " +
            "    C.Nombre AS Cadena, " +
            "    S.Nombre AS Sucursal, " +
            "    S.Domicilio " +
            "FROM  " +
            "    Cadena C  " +
            "JOIN Sucursal S ON C.RFC = S.RFC " +
            "WHERE  " +
            "    C.RFC IN  " +
            "        (SELECT TOP 1 RFC " +
            "			FROM  Sucursal  " +
            "			GROUP BY  RFC  " +
            "			ORDER BY  COUNT(IdS) DESC " +
            "        );";
            lsDomiciliosSucursales = context.Database.SqlQuery < DomicilioSucursal>(cadSql).ToList();
            GrdRes.DataSource = lsDomiciliosSucursales;
            GrdRes.DataBind();
            RsltTxt.Text = "Resultado de consulta 4";
        }

        protected void BtnEject_Click1(object sender, EventArgs e)
        {
            // Verifica que se le haya proporcionado nombre de cadena
            if (DdlNomCad.Text == " ")
            {
                MsjErr.Text = "No se seleccionó ninguna cadena";
            }
            else
            {
                MsjErr.Text = "";

                // Se encuentran los nombres y se cargan al GridView
                cadSql = $"SELECT DISTINCT C.Nombre " +
                    "FROM Cliente C " +
                    "JOIN Factura F ON C.IdC = F.IdC " +
                    "JOIN Sucursal S ON F.IdS = S.IdS " +
                    "JOIN Cadena CA ON S.RFC = CA.RFC " +
                    $"WHERE CA.Nombre like '{DdlNomCad.Text}' " +
                    "GROUP BY C.IdC, C.Nombre " +
                    "HAVING SUM(F.MontoT) * 0.10 > SUM(F.Saldo); ";
                lsNombres = context.Database.SqlQuery<NombreCliente>(cadSql).ToList();
                GrdRes.DataSource = lsNombres;
                GrdRes.DataBind();


                RsltTxt.Text = "Resultado de consulta 1";

                // Ocultamos los controles
                desactivaControles();
            }
        }
    }
}