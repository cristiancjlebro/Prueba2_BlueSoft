using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.CompilerServices;
using System.Web.UI;
using WebApplication1.Data;

namespace WebApplication1
{
    public partial class _Default : Page
    {
        private DataTable _dataTable = new DataTable();
        private MetodosSql sql = new MetodosSql(ConfigurationManager.ConnectionStrings["SqlConexion"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            InicializarDatos();
        }

        protected void Consultar(object sender, EventArgs e)
        {
            FiltrarTabla("Cargo", DdCargos.SelectedItem.Text);
        }

        public void InicializarDatos() {
            var da = sql.AbrirConexion();
            _dataTable = sql.ReturnDataTable("dbo.Sp_agenda");
            GridEmpleado.DataSource = _dataTable;
            GridEmpleado.DataBind();
            lblRegistros.Text = "Registros Encontrados: " + GridEmpleado.Rows.Count.ToString();
        }

        public void FiltrarTabla(string field, string value) {
            DataView dataView = new DataView(_dataTable);
            dataView.RowFilter = field + "= '" + value + "'";
            GridEmpleado.DataSource = dataView;
            GridEmpleado.DataBind();
            lblRegistros.Text = "Registros Encontrados: " + GridEmpleado.Rows.Count.ToString();
        }

        protected void Restaurar(object sender, EventArgs e)
        {
            InicializarDatos();
        }
    }
}