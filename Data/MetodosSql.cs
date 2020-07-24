using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using DataTable = System.Data.DataTable;

namespace WebApplication1.Data
{
    public class MetodosSql
    {
        private string CadenaConex_ = string.Empty;

        public MetodosSql(string CadenaConexionBD)
        {
            CadenaConex_ = CadenaConexionBD;
        }
        private SqlConnection connection;
        private SqlCommand commandSql;
        private SqlDataAdapter dAdapterSql;
        private DataSet _dataSet;
        private DataTable _dataTable;
        public bool AbrirConexion () {
            try {
                connection = new SqlConnection(CadenaConex_);
                connection.Open();
                return true;
            } catch (Exception) {
                return false;
            }
        }

        public bool CerrarConexion() {
            if (connection.State == ConnectionState.Open) {
                connection.Close();
                return true;
            }
            return false;
        }
        public DataTable ReturnDataTable(string qry) {
            dAdapterSql = new SqlDataAdapter();
            _dataSet = new DataSet();
            _dataTable = new DataTable();
            try
            {
                if (AbrirConexion())
                {
                    dAdapterSql.SelectCommand = new SqlCommand(qry, connection);
                    dAdapterSql.Fill(_dataSet, "Tabla");
                    _dataTable = _dataSet.Tables["Tabla"];
                }
                return _dataTable;
            }
            catch (Exception ex)
            {
                return _dataTable;
            }
            finally 
            {
                CerrarConexion();
                dAdapterSql = null;
                _dataSet = null;
                _dataTable = null;
            }
        }

        public DataTable StoredProcedureSql(string storedProcedure, string parametro) {
            try
            {
                if (AbrirConexion())
                {
                    commandSql = new SqlCommand();
                    dAdapterSql = new SqlDataAdapter();
                    _dataTable = new DataTable();

                    commandSql.Connection = connection;
                    commandSql.CommandType = CommandType.StoredProcedure;
                    commandSql.CommandText = storedProcedure;
                    commandSql.Parameters.Add("@cargoId", SqlDbType.Int).Value = int.Parse(parametro);

                    dAdapterSql.SelectCommand = commandSql;
                    dAdapterSql.SelectCommand.CommandTimeout = 0;
                    dAdapterSql.Fill(_dataTable);
                }
                return _dataTable;
            }
            catch (Exception)
            {
                return new DataTable();
            }
            finally {
                CerrarConexion();
            }
        }
    }
}