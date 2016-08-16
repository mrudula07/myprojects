<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Login.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="ChurchRecordkeeping.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="~/Style/site.css" rel="stylesheet" type="text/css" />
    <link href="~/Style/custom.css" rel="stylesheet" type="text/css" />
     <link href="~/Style/style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div>

 <%--<p>
        Please enter your username and password.
        <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false"></asp:HyperLink> .
    </p>--%>
 <table>
 <tr><td> <font  class="gray-page-title">Log In</font></td></tr>
<%-- <tr><td height="20px"></td></tr>--%>
 <tr><td>  Please enter your username and password.</td></tr>
 
<tr><td>    <asp:Label ID="lblErrorMsg" runat="server" Text="" CssClass="label_errormessage"
                                                                    Visible="true"></asp:Label></td></tr>
 
<tr>
<td>
<table ><%--
<tr><td>    <asp:Label ID="lblErrorMsg" runat="server" Text="" CssClass="label_errormessage"
                                                                    Visible="true"></asp:Label></td></tr>--%>
<tr>
<td>
  <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username:</asp:Label>
                      
                        
</td>
<td>  <asp:TextBox ID="UserName" runat="server" runat ="server" Width="280px" CssClass="textEntry"></asp:TextBox><asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                             CssClass="failureNotification" ErrorMessage="User Name is required." ToolTip="User Name is required." 
                             ValidationGroup="LoginUserValidationGroup">Username is required</asp:RequiredFieldValidator></td>
</tr>
<tr ><td colspan="2" height="6px"></td></tr>

<tr>
<td>
<asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
</td>
<td>
<asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password" Width="280px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                             CssClass="failureNotification" ErrorMessage="Password is required." ToolTip="Password is required." 
                             ValidationGroup="LoginUserValidationGroup">Password is required</asp:RequiredFieldValidator>
</td>
</tr>
<tr>
<td colspan="3" align="left">  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:CheckBox ID="RememberMe" runat="server"/>
                       <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline">Remember me. &nbsp;&nbsp;</asp:Label>
                     <%--  <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="True" ForeColor="#3333FF">Forgot your Password?</asp:HyperLink>--%>
                      <asp:HyperLink ID="HyperLink1" runat="server" onclick="return confirm('Please contact admin 9403376035 for your query');" Font-Underline="True" ForeColor="#3333FF">Forgot your Password?</asp:HyperLink>  
                        </td>
<%--<td align="right" style="Padding-right:20px;"> 
</td>--%></tr>

<tr>
<td height="12px"></td></tr>
<tr>
<%--<td>
     </td>--%><td align="right" colspan="3" style="Padding-right:140px;"> <asp:Button ID="LoginButton" runat="server" OnClick="LoginButton_Click" CommandName="Login" Text="Log In" ValidationGroup="LoginUserValidationGroup"/></td></tr>
</table>
</td>
<td>
<table><tr><td width="160px"></td></tr></table>
</td>
<td><table><tr><td>
    <asp:Image ID="Image1" ImageUrl="~/Images/cross.jpg" runat="server" />
</td></tr></table></td>
</tr>
    </table>
 </div>
</asp:Content>
