<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="Fundmenu.aspx.cs" Inherits="ChurchRecordkeeping.UserScreens.Fundmenu" %>
 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="~/Style/site.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <ajaxtoolkit:TabContainer ID="tabs" runat="server" Width="900px"  AutoPostBack="true"
         Height="450px"  BackColor="White"
         ActiveTabIndex="1" ForeColor="#0066FF"  Font-Bold="True" 
         Font-Names="Berlin Sans FB" Font-Size="Large" Font-Strikeout="True"  >
        <ajaxtoolkit:TabPanel ID="tabaddfund" runat="server" HeaderText="Add Fund"  BackColor="White" Height="200px" >
            <ContentTemplate ><iframe id="Iframe1"  src="Addnewfund.aspx" width="820px" height="200px"  
                    frameborder="0" scrolling="no" runat="server"    style="background-color: #FFFFFF" 
                     ></iframe></ContentTemplate>
        </ajaxtoolkit:TabPanel>
        <ajaxtoolkit:TabPanel ID="TabviewFund" runat="server" HeaderText="View Funds"  BackColor="White" Height="382px" >
            <ContentTemplate><iframe id="Iframe2"  src="ViewFund.aspx" width="820px"  
                    frameborder="0" scrolling="no" runat="server"
             style="background-color: #FFFFFF; height: 382px;"   ></iframe></ContentTemplate>
        </ajaxtoolkit:TabPanel>
         </ajaxtoolkit:TabContainer> 
</asp:Content>
