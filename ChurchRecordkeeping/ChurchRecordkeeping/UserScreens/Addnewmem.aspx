<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Addnewmem.aspx.cs" Inherits="ChurchRecordkeeping.UserScreens.Addnewmem" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <link href="~/Style/site.css" rel="stylesheet" type="text/css" />
    <link href="~/Style/custom.css" rel="stylesheet" type="text/css" />
     <link href="~/Style/style.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript">
      

    function Refresh() {
        window.parent.location = window.parent.location.href;
    }

    function OnClientClicked(button, args) {
        if (window.confirm("Are you sure you want to view the grid?")) {
            window.parent.location = window.parent.location.href;
        }
        else {
            button.set_autoPostBack(false);
        }
    }

    </script>
    <title></title>
</head>
<body style="background-color: #FFFFFF">
      
    <form id="form1" runat="server" border="0" style="background-color: #FFFFFF">
   
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  
    <div >
     <table align="center" border="0" cellpadding="0" cellspacing="0" width="800"  
            valign="middle" bgcolor="White">
                    <tr>
                        <td align="left" valign="top">
                        </td>
                        <td align="left" valign="middle" width="500" colspan="2" style="padding-left:10px;">
                         <font  class="gray-page-title"><asp:label runat="server" ID="addmember" CssClass="gray-page-title" Text="Add New Member" ></asp:label></font>
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
                                                            <td align="center" height="20" colspan="3" valign="top">
                                                                <asp:Label ID="lblErrorMsg" runat="server" Text="" CssClass="label_errormessage"
                                                                    Visible="true"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                        <td align="left" colspan="3" height="10" valign="top" width="100%">
                        </td>
                    </tr>
                     <tr>
                        <td align="left" colspan="3" valign="middle" width="100%">
                            <table align="center"  cellpadding="0" cellspacing="0" border="0" width="800">
                            <tr>
                            <td >
                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="720">
																						                                                        <tr>
																						                                                            <td align="left" valign="top" width="600" colspan="4"></td>
																						                                                        </tr>
																						                                                        <tr>
																						                                                            <td align="left" valign="top" width="158" style="padding-left:7%;">
                                                                                                                                                        <font class="news-font01">Firstname<font class="red11">*</font>:</font></td>
																						                                                            <td align="left" valign="top" width="158" bgcolor="White">
                                                                                                                                                         <telerik:RadTextBox ID="FirstnameIDtxtbox" runat="server" AutoPostBack="true"  EmptyMessage="Enter Firstname" OnTextChanged="TextBox1_TextChanged"   CssClass="text-box-yellow" Width="200px"></telerik:RadTextBox>

                                                                                                                                                    </td>
																						                                                            <td align="center" valign="top" width="159">
                                                                                                                                                       <font class="news-font01">Lastname<font class="red11">*</font>:</font> </td>
																						                                                            <td align="left" valign="top" width="225"> 
                                                                                                                                                    <telerik:RadTextBox ID="LastnameIDtxtbox" runat="server" EmptyMessage="Enter Lastname" AutoPostBack="true"  OnTextChanged="LastnameIDtxtbox_TextChanged" CssClass="text-box-yellow" Width="200px"></telerik:RadTextBox>

                                                                                                                                                   <%-- <telerik:RadComboBox ID="cmbCommunicationType" runat="server" CssClass="textCombo-normal"
                                                                                                                                                AutoPostBack="true" 
                                                                                                                                                Width="200px" Height="150px">
                                                                                                                                            </telerik:RadComboBox>--%>   
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
                                                                                                                                                 <tr>
																						                                                            <td align="left" valign="top" width="158" style="padding-left:7%;">
                                                                                                                                                        <font class="news-font01">Address<font class="red11">*</font>:</font></td>
																						                                                            <td align="left" valign="top" width="158">
                                                                                                                                                        <telerik:RadTextBox ID="AddressRadTextBox" runat="server" EmptyMessage="Enter Address" AutoPostBack="true" CssClass="text-box-yellow" Width="200px"></telerik:RadTextBox>

                                                                                                                                                    </td>
																						                                                            <td align="center" valign="top" width="159">
                                                                                                                                                       <font class="news-font01">City<font class="red11">*</font>:</font> </td>
																						                                                            <td align="left" valign="top" width="225">
                                                                                                                                                     <telerik:RadTextBox ID="CityIDtxtbox" runat="server" EmptyMessage="Enter City"  AutoPostBack="true" OnTextChanged="CityIDtxtbox_TextChanged"  CssClass="text-box-yellow" Width="200px"></telerik:RadTextBox>

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
                                                                                                                                                 <tr>
																						                                                            <td align="left" valign="top" width="158" style="padding-left:7%;">
                                                                                                                                                        <font class="news-font01">State<font class="red11">*</font>:</font></td>
																						                                                            <td align="left" valign="top" width="158">
                                                                                                                                                        <telerik:RadComboBox ID="StateRadComboBox"   runat="server" AutoPostBack="true" 
                                                                                                                                                            CssClass="textCombo-normal" Height="180px" OnSelectedIndexChanged = "StateRadComboBox_OnSelectedIndexChanged"
                                                                                                                                                            Width="200px">
                                                                                                                                                           
                                                                                                                                                        </telerik:RadComboBox>

                                                                                                                                                    </td>
																						                                                            <td align="center" valign="top" width="159">
                                                                                                                                                       <font class="news-font01">Zipcode<font class="red11">*</font>:</font> </td>
																						                                                            <td align="left" valign="top" width="225">
                                                                                                                                                     <telerik:RadTextBox ID="ZipcodeRadTextBox" runat="server" AutoPostBack="true" OnTextChanged="ZipcodeRadTextBox_OnTextChanged" EmptyMessage="Enter Zipcode" CssClass="text-box-yellow" Width="200px"></telerik:RadTextBox>

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
																						                                                        <tr>
                                                                                                                                                    <td align="left" valign="top" width="158" style="padding-left:7%;">
                                                                                                                                                        <font class="news-font01">Envelope No<font class="red11">*</font>:</font></td>
                                                                                                                                                    <td align="left" class="style2" colspan="3" valign="top" width="250px">
                                                                                                                                                        <telerik:RadTextBox ID="EnvelopeRadText" runat="server" EmptyMessage="Envelope Number"  AutoPostBack="true" OnTextChanged="EnvelopeRadText_OnTextChanged" CssClass="text-box-yellow" Width="200px"></telerik:RadTextBox>

                                                                                                                                                    </td>
                                                                                                                                                </tr>
                                                                                                                                               <%-- <tr>
                                                                                                                                                    <td align="left" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                    <td align="left" class="style2" colspan="3" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                </tr>--%>
                                                                                                                                                <tr>
                                                                                                                                                    <td align="left" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                    <td align="right" valign="top" colspan="3" valign="top" width="158" style="padding-right:30px;">
                                                                                                                                                    <telerik:RadButton runat="server" ID="save1" Text="Save"  ToolTip="Submit Details" ButtonType="StandardButton"  OnClick="Save_onclick"  AutoPostBack="true"></telerik:RadButton>
                                                                                                                                                       
                                                                                                                                                        &nbsp;
                                                                                                                                                           <telerik:RadButton ID="Cancel" runat="server" OnClick="Cancel_onclick"  AutoPostBack="true" Text="Clear" ToolTip="Cancel Details" ButtonType="StandardButton" ></telerik:RadButton>
                                                                                                                                                  &nbsp;
                                                                                                                                                   <telerik:RadButton ID="ViewGridID" runat="server" OnClientClicked="OnClientClicked" AutoPostBack="true" Text="ViewGrid" ToolTip="ViewGrid" ButtonType="StandardButton" ></telerik:RadButton>
                                                                                                                                                  
                                             <%--                                                                                                     <button  type="button" id="viewgrid"  onClick="Refresh()">View grid</button>--%>
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
