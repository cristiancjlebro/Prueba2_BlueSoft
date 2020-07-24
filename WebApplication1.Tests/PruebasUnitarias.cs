using System;
using System.Configuration;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Data;
using WebApplication1.Data;
using Xunit.Sdk;
using NUnit.Framework.Internal;

namespace WebApplication1.Tests
{
    [TestClass]
    public class PruebasUnitarias
    {
        private string conexion = ConfigurationManager.ConnectionStrings["SqlConexion"].ConnectionString;
        DataTable _dataTable = new DataTable();

        [TestMethod]
        public void ValidarConexion()
        {
            MetodosSql sql = new MetodosSql(conexion);
            if (sql.AbrirConexion())
            {
                Console.WriteLine("Conexión Abierta");
            }
            else
            {
                Console.WriteLine("Error abriendo la conexión");
            }
        }

        [TestMethod]
        public void CerrarConexion()
        {
            MetodosSql sql = new MetodosSql(conexion);
            sql.AbrirConexion();
            if (sql.CerrarConexion())
            {
                Console.WriteLine("Conexión Cerrada");
            }
            else
            {
                Console.WriteLine("Error cerrando la conexión");
            }
        }

        [TestMethod]
        public void RetornarDatos()
        {
            MetodosSql sql = new MetodosSql(conexion);
            
            _dataTable = sql.ReturnDataTable("dbo.Sp_agenda");
            if (_dataTable.Rows.Count > 0)
            {
                Console.WriteLine("Data retornada correctamente");
            }
            else
            {
                Console.WriteLine("Error retornando data");
            }
        }
    }
}
