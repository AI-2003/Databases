using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

namespace CadComerWebsite.EF
{
    public partial class ComprasClienteFecha : System.Web.UI.Page
    {
    //Variables de clase
    CadComerEntities context = new CadComerEntities();
    string cadSql;
    List<Cliente> lsClientes;
    //Clase local para guardar el resultado de la consulta de varios campos
    public class ConsultaFecha {
    public int Folio { get; set; }
    public String Nombre { get; set; }
    public int Cant { get; set; }
    public float Total { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //IsPostBack = false, la primera vez que se entra a la página
            {
                cadSql = "select * from Cliente"; //Creamos una cadena para buscar los clientes 
                lsClientes = context.Cliente.SqlQuery(cadSql).ToList(); //Realizamos la consulta que definimos arriba
                DdlCliente.Items.Add(" "); //Añadimos al DDL un espacio en blanco
                foreach (Cliente li in lsClientes) //iteramos en la lista
                {
                    DdlCliente.Items.Add(li.Nombre); //Añadimos el nombre del cliente al DDL
                }
                LblProductos.Text = "";
            }
        }
        protected void BtnEject_Click(object sender, EventArgs e) {
            //Desactivamos los controles para que no puedan elegir otra fecha ni otro nombre
            if (DdlCliente.SelectedIndex > 0 && ClndrFecha.SelectedDate != null)
            {
                BtnEject.Enabled = false; //Desactiva el botón ejecutar
                cadSql = "select * from Cliente"; //Creamos una cadena para buscar los clientes 
                lsClientes = context.Cliente.SqlQuery(cadSql).ToList(); //Realizamos la consulta que definimos arriba
        
                cadSql = $"Select F.IdF as Folio, P.Nombre, D.Cantidad as Cant, F.MontoT as Total " +
                         $"from Factura F, Cliente C, Detalle D, Producto P " +
                         $"where C.IdC = {lsClientes[DdlCliente.SelectedIndex].IdC} and F.Fecha >= '{ClndrFecha.SelectedDate.ToString("yyyy-MM-dd")}' " +
                         $"and F.IdC = C.IdC and D.IdF = F.IdF and P.IdP = D.IdP"; //Cadena de búsqueda
                //dado el nombre de un cliente (a través de un DDL) y una fecha (por medio
                //de un Calendar), se muestren todas las compras que ese cliente ha efectuado a partir de esa
                //fecha, detallando por cada compra el folio, el nombre, la cantidad de unidades y el monto total
                //de los artículos comprados
        
        
                List<ConsultaFecha> lsConsultaF; //Creamos una nueva lista que contenga los campos de la consulta de varias tablas
                lsConsultaF = context.Database.SqlQuery<ConsultaFecha>(cadSql).ToList(); //Realizamos la consulta
                GrdCompras.DataSource = lsConsultaF; //Mostramos en el GridView los datos
                GrdCompras.DataBind();
                LblProductos.Text = "Productos diferentes " + cuentaDiferentes(lsConsultaF).ToString(); //Obtenemos los productos diferentes que ha comprado
        
            }
            else //Si no tenemos una fecha o nombre elegido
            {
                MsjErr.Enabled = true; //Mostramos la etiqueta
                MsjErr.Text = "Dame una fecha y fecha válidas"; //Le asignamos un mensaje
            }
        }
        
        //Botón para limpiar lo que tenemos en el GridView
        protected void BtnLimpiar_Click(object sender, EventArgs e) {
            GrdCompras.DataSource = null;
            GrdCompras.DataBind();
            LblProductos.Text  = "";
            BtnEject.Enabled = true;
        
        } 
        //Método auxiliar para contar los diferentes productos que ha comprado el cliente
        //Recibe como parámetro la lista que contiene el folio, nombre, cantidad y monto de los productos
        private int cuentaDiferentes(List<ConsultaFecha> lsConsulta) {
            List<String> lista = new List<String>(); //Creamos una lista auxiliar para meter los productos diferentes
            foreach(ConsultaFecha Cons in lsConsulta) //Checamos cada consulta de la lista
            {
                if(!lista.Contains(Cons.Nombre)){ //Si el producto no está en la lista
                    lista.Add(Cons.Nombre); //Entonces lo agregamos
                }
            }
            return lista.Count; //Regresamos el total
        }
    }
}
