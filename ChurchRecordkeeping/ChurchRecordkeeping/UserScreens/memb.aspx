<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="ChurchRecordkeeping.UserScreens.WebForm2" %>
 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link href="~/Style/site.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
         <ajaxtoolkit:TabContainer ID="tabs" runat="server" Width="900px"  AutoPostBack="true"
         Height="400px"  BackColor="White"
         ActiveTabIndex="1" ForeColor="#0066FF"  Font-Bold="True" 
         Font-Names="Berlin Sans FB" Font-Size="Large" Font-Strikeout="True"  >
        <ajaxtoolkit:TabPanel ID="tabaddDonation" runat="server" HeaderText="Add Member"   BackColor="White" Height="250px"  >
            <ContentTemplate  >
            <iframe id="Iframe1"  src="Addnewmem.aspx" width="820px" height="400px"  
                    frameborder="0" scrolling="no" runat="server" 
                    style="background-color: #FFFFFF"   ></iframe></ContentTemplate>
        </ajaxtoolkit:TabPanel>
        <ajaxtoolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="View Members"   BackColor="White" Enabled="true" >
            <ContentTemplate ><iframe id="Iframe2"  src="viewmember.aspx" width="820px" height="400px"  frameborder="0" scrolling="no" runat="server"   ></iframe></ContentTemplate>
        </ajaxtoolkit:TabPanel>
         </ajaxtoolkit:TabContainer>
</asp:Content>
