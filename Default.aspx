<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Historial Asignación Empleados</h1>
        <div class="row">
            <div class="col">
                <label>Seleccionar cargo para filtrar: </label>
                <asp:DropDownList
                    ID="DdCargos"
                    Font-Size="Medium"
                    runat="server"
                    DataSourceID="SqlDataSource1"
                    DataTextField="Descripcion_Cargo"
                    DataValueField="CargoId"
                    class="ddList">
                </asp:DropDownList>
            </div>
            <div class="col">
                <asp:Button
                    ID="BtnConsultar"
                    runat="server"
                    OnClick="Consultar"
                    Text="Consultar"
                    class="btn btn-info " />
                <asp:Button
                    ID="BtnResetear"
                    runat="server"
                    OnClick="Restaurar"
                    Text="Restaurar Data"
                    class="btn btn-danger " />
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlueSoftConnectionString %>" SelectCommand="Select [CargoId], [Descripcion_Cargo] from Cargo"></asp:SqlDataSource>
    </div>
    <asp:Label
        ID="lblRegistros"
        runat="server"
        Enabled=" false"
        ForeColor="red"></asp:Label>
    <br />
    <div>
        <div class="container">
            <asp:GridView
                Font-Size="11pt" AlternatingRowStyle-BackColor="#f7f7f9"
                ID="GridEmpleado"
                runat="server"
                CaptionAlign="Top"
                PageIndex="0"
                PagerSettings-Mode="NextPrevious"
                CssClass="table">
            </asp:GridView>
        </div>
    </div>
</asp:Content>
