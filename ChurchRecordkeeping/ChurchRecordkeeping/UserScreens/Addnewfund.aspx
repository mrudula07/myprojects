<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Addnewfund.aspx.cs" Inherits="ChurchRecordkeeping.UserScreens.Addnewfund" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="~/Style/site.css" rel="stylesheet" type="text/css" />
    <link href="~/Style/custom.css" rel="stylesheet" type="text/css" />
     <link href="~/Style/style.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript">
         function OnClientClicked(button, args) {
             if (window.confirm("Are you sure you want to view the grid?")) {
                 window.parent.location = window.parent.location.href;
             }
             else {
                 button.set_autoPostBack(false);
             }
         }
</script>
</head>
<body bgcolor="#ffffff" style="background-color: #FFFFFF">
    <form id="form1" runat="server" 
    style="background-color: #FFFFFF" >
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
     <table align="center" border="0" cellpadding="0" cellspacing="0" width="800" 
            bgcolor="White" style="height: 283px">
                    <tr>
                        <td align="left" valign="top">
                        </td>
                        <td align="left" valign="bottom" width="500" colspan="2" style="padding-left:20px;">
                        <asp:label text="Create New Fund" class="gray-page-title" runat="server" ID="createlabel"></asp:label>
                        <%-- <font class="gray-page-title"></font>--%>
                        </td>
                        <td align="right" valign="middle">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="3" height="6" valign="top" width="100%">
                        </td>
                    </tr>
                    <tr>
                                                            <td align="left" height="20" colspan="3" valign="top" style="padding-left:160px;">
                                                                <asp:Label ID="lblErrorMsg" runat="server" Text="" CssClass="label_errormessage"
                                                                    Visible="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                        <td align="left" colspan="3" height="10" valign="top" width="100%">
                        </td>
                    </tr>
                     <tr>
                        <td align="left" colspan="3" valign="top" width="100%">
                            <table align="center"  cellpadding="0" cellspacing="0" border="0" width="907" 
                                bgcolor="White">
                            <tr>
                            <td >
                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="767">
																						                                                        <tr>
																						                                                            <td align="left" valign="top" width="767" colspan="4"></td>
																						                                                        </tr>
																						                                                        <tr>
																						                                                            <td align="left" valign="top" width="158" style="padding-left:7%;">
                                                                                                                                                        <font class="news-font01">Fund Name<font class="red11">*</font>:</font></td>
																						                                                            <td align="left" valign="top" width="158">
                                                                                                                                                         <telerik:RadTextBox ID="fundnametxtbox" runat="server" EmptyMessage="Enter Fund Name" CssClass="text-box-yellow" Width="200px"></telerik:RadTextBox>

                                                                                                                                                    </td>
																						                                                           
																						                                                        </tr>
																						                                                        
                                                                                                                                                 
																						                                                        <tr>
                                                                                                                                                    <td align="left" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                    <td align="left" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                    <td align="left" valign="top" width="159" class="style1" colspan="2">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                </tr>
                                                                                                                                               <%--  <tr id="TRR">
																						                                                            <td align="left" valign="top" width="158" style="padding-left:7%;">
                                                                                                                                                        <font class="news-font01">Fund Number<font class="red11">*</font>:</font></td>
																						                                                            <td align="left" valign="top" width="158">
                                                                                                                                                        <telerik:RadComboBox ID="RadComboBoxState" EmptyMessage="---Select Fund No.---" runat="server" AutoPostBack="true" 
                                                                                                                                                            CssClass="textCombo-normal" 
                                                                                                                                                            Width="200px">
                                                                                                                                                        </telerik:RadComboBox>
                                                                                                                                                    </td>
																						                                                           
																						                                                        </tr>--%>
																						                                                        <tr>
                                                                                                                                                    <td align="left" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                    <td align="left" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                    <td align="left" valign="top" width="159" class="style1" colspan="2">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                </tr>
																						                                                       
                                                                                                                                                <tr>
                                                                                                                                                   <%-- <td align="left" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>--%>
                                                                                                                                                    <td align="right" class="style2"  valign="top" width="167" colspan="2" style="Padding-left:40px;">
                                                                                                                                                    <telerik:RadButton ID="Save1"  OnClick="Save_onclick" runat="server" Text="Save" ToolTip="Submit Details" ButtonType="StandardButton" ></telerik:RadButton>
                                                                                                                                                       
                                                                                                                                                        &nbsp;
                                                                                                                                                           <telerik:RadButton ID="clear1" runat="server" OnClick="Cancel_onclick" Text="Clear" ToolTip="Clear Details" ButtonType="StandardButton" ></telerik:RadButton>
                                                                                                                                                   &nbsp;
                                                                                                                                                   <telerik:RadButton ID="ViewGridID" runat="server" OnClientClicked="OnClientClicked" AutoPostBack="true" Text="ViewGrid" ToolTip="ViewGrid" ButtonType="StandardButton" ></telerik:RadButton>
                                                                                                                                                  
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                </tr>
                                                                                                                                                
                                                                                                                                                 <tr>
                                                                                                                                                    <td align="left" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                    <td align="left" class="style2" colspan="3" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                </tr>
                                                                                                                                                <tr><td colspan="4">
                                                                                                                                                </td></tr>
                                                                                                                                               
																						                                                    </table>
                            </td>
                            </tr>
                            </table>
                            </td>
                            </tr>
                            
                    </table>
    
    </div>
    </form>
</body>
</html>
