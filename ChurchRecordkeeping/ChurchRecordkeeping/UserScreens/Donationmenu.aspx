<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="Donationmenu.aspx.cs" Inherits="ChurchRecordkeeping.UserScreens.Donationmenu" %>
 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="~/Style/site.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div align="left" style="background-color: #FFFFFF" >
     <ajaxtoolkit:TabContainer ID="tabs" runat="server" Width="900px"  AutoPostBack="true"
         Height="400px"  BackColor="White"
         ActiveTabIndex="1" ForeColor="#0066FF"  Font-Bold="True" 
         Font-Names="Berlin Sans FB" Font-Size="Large" Font-Strikeout="True"  >
        <ajaxtoolkit:TabPanel ID="tabaddDonation" runat="server" HeaderText="Add Donation"  BackColor="White" Height="300px" >
            <ContentTemplate >
                <iframe  src="NewDonation.aspx" width="820px"  
                    frameborder="0" scrolling="no" runat="server" 
                    style="background-color: #FFFFFF; height:400px;"   ></iframe></ContentTemplate>
        </ajaxtoolkit:TabPanel>
        <ajaxtoolkit:TabPanel ID="TabPanel1" runat="server" HeaderText="View Donations"  BackColor="White" >
            <ContentTemplate><iframe  src="ViewDonation.aspx" width="820px" height="400px"  frameborder="0" scrolling="no" runat="server"   ></iframe></ContentTemplate>
        </ajaxtoolkit:TabPanel>
         </ajaxtoolkit:TabContainer> 
         </div>
</asp:Content>
