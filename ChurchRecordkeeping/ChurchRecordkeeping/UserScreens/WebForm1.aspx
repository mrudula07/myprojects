<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ChurchRecordkeeping.UserScreens.WebForm1" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />

        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Silk">
            <Tabs>
                <telerik:RadTab Text="My Cook Book" Width="200px"></telerik:RadTab>
                <telerik:RadTab Text="Newest" Width="200px"></telerik:RadTab>
                <telerik:RadTab Text="Top Recipe" Width="200px"></telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="RadPageView1">
                <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage2"
                    Orientation="VerticalLeft" Skin="Silk" Width="50px" Height="355px" SelectedIndex="0">
                    <Tabs>
                        <telerik:RadTab ImageUrl="images/icon_AllRecipes.png" ToolTip="Main Course" SelectedImageUrl="images/icon_AllRecipes_hover.png" HoveredImageUrl="images/icon_AllRecipes_hover.png" Height="40px"></telerik:RadTab>
                        <telerik:RadTab ImageUrl="images/icon_Desserts.png" ToolTip="Desserts" SelectedImageUrl="images/icon_Desserts_hover.png" HoveredImageUrl="images/icon_Desserts_hover.png" Height="40px"></telerik:RadTab>
                        <telerik:RadTab ImageUrl="images/icon_Soups.png" ToolTip="Soups" SelectedImageUrl="images/icon_Soups_hover.png" HoveredImageUrl="images/icon_Soups_hover.png" Height="40px"></telerik:RadTab>
                        <telerik:RadTab ImageUrl="images/icon_Seafood.png" ToolTip="Seafood" SelectedImageUrl="images/icon_Seafood_hover.png" HoveredImageUrl="images/icon_Seafood_hover.png" Height="40px"></telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                </telerik:RadPageView>
                </telerik:RadMultiPage>


</asp:Content>
