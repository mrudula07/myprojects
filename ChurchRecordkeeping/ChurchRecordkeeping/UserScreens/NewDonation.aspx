<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewDonation.aspx.cs" Inherits="ChurchRecordkeeping.UserScreens.NewDonation" %>

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
<body>
    <form id="form1" runat="server" 
    style="background-color: #FFFFFF" >
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
     <table align="center" border="0" cellpadding="0" cellspacing="0" width="807" bgcolor="White" >
                    <tr>
                       <%-- <td align="left" valign="top">
                        </td>--%>
                        <td align="left" valign="middle" colspan="4">
                        <table><tr>
                        <td align="left" width="500" bgcolor="White" style="padding-left:70px;">
                       <%--  <font class="gray-page-title">Create New Donation</font>--%>
                         <asp:Label runat="server" Text="Create New Donation" ID="createdonation" CssClass ="gray-page-title"></asp:Label>
                        </td>
                        <td align="right" style="padding-left:60px;">
                        <telerik:RadDatePicker ID="RadDatePicker" runat="server" Width="100px" Skin="Vista" 
                                                                         >
                                                                <Calendar ID="Calendar1" Skin="Vista" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" runat="server"
                                                                   ViewSelectorText="x">
                                                                   </Calendar>
                                                                  <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                                                   <DateInput ID="DateInput1" DateFormat="M/d/yyyy" DisplayDateFormat="M/d/yyyy" EnableSingleInputRendering="True" runat="server"
                                                                  LabelWidth="64px" >
                                                                     </DateInput>
                                                                      </telerik:RadDatePicker>
                       
                        </td>
                        </tr></table>
                        
                        </td>
                       <%-- <td align="left" valign="middle">
                            &nbsp;
                                </td>--%>
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
                        <td align="left" colspan="3" valign="top" width="100%">
                            <table align="center"  cellpadding="0" cellspacing="0" border="0" width="800" 
                                style="height: 375px">
                            <tr>
                            <td bgcolor="White">
                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="767">
																						                                                        <tr>
																						                                                            <td align="left" valign="top" width="767" colspan="4"></td>
																						                                                        </tr>
																						                                                        <tr>
																						                                                            <td align="left" valign="top" width="158" style="padding-left:7%;">
                                                                                                                                                        <font class="news-font01">Envelope No.<font class="red11">*</font>:</font></td>
																						                                                            <td align="left" valign="top" width="158">
                                                                                                                                                          <telerik:RadComboBox ID="EnveRadComboBox"  runat="server" AutoPostBack="true" 
                                                                                                                                                            CssClass="textCombo-normal" 
                                                                                                                                                            Width="200px">
                                                                                                                                                        </telerik:RadComboBox>
                                                                                                                                                    </td>
																						                                                            <td align="center" valign="top" width="159">
                                                                                                                                                       <font class="news-font01">Amount<font class="red11">*</font>:</font> </td>
																						                                                            <td align="left" valign="top" width="225"> 
                                                                                                                                                    <telerik:RadTextBox ID="Amounttxtbox" runat="server" EmptyMessage="Enter Amount" CssClass="text-box-yellow" Width="200px"></telerik:RadTextBox>

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
                                                                                                                                                        <font class="news-font01">Fund Name<font class="red11">*</font>:</font></td>
																						                                                            <td align="left" valign="top" width="158">
                                                                                                                                                        <telerik:RadComboBox ID="Fundnameradcombo"  runat="server" AutoPostBack="true" 
                                                                                                                                                            CssClass="textCombo-normal" 
                                                                                                                                                            Width="200px">
                                                                                                                                                        </telerik:RadComboBox>
                                                                                                                                                    </td>
																						                                                            <td align="center" valign="top" width="159">
                                                                                                                                                       <font class="news-font01">Money Type<font class="red11">*</font>:</font> </td>
																						                                                            <td align="left" valign="top" width="225">
                                                                                                                                                      <telerik:RadComboBox ID="moneytypecombo" EmptyMessage="---Select Money Type---" runat="server" AutoPostBack="true" 
                                                                                                                                                            CssClass="textCombo-normal" 
                                                                                                                                                            Width="200px">
                                                                                                                                                            <Items>
                                                                                                                                                            <telerik:RadComboBoxItem  Text="Cash" Value="1"/>
                                                                                                                                                            <telerik:RadComboBoxItem  Text="Check" Value="2"/>
                                                                                                                                                            </Items>
                                                                                                                                                        </telerik:RadComboBox>
                                                                                                                                            </td>
																						                                                        </tr>
                                                                                                                                                <tr>
                                                                                                                                                <td height="15px"></td>
                                                                                                                                                </tr>
																						                                                       
                                                                                                                                                
                                                                                                                                                <tr>
                                                                                                                                                    <td align="center" valign="top" width="158">
                                                                                                                                                        &nbsp;
                                                                                                                                                          <font class="news-font01">Note<font class="red11"></font>:</font> </td></td>
                                                                                                                                                    <td align="left" class="style2" colspan="3" valign="top" width="158">
                                                                                                                                                         <telerik:RadTextBox ID="NoteRadTextBox" runat="server" EmptyMessage="Enter Note"  CssClass="text-box-yellow" Width="200px" TextMode="MultiLine"></telerik:RadTextBox>
&nbsp;
                                                                                                                                                        </td>
                                                                                                                                                </tr>
                                                                                                                                                <tr>
                                                                                                                                                    <td align="left" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                    <td align="right" valign="top" colspan="3" valign="top" width="158" style="padding-right:30px;">
                                                                                                                                                    <telerik:RadButton ID="Savebutton" OnClick="Save_onclick" runat="server" Text="Save" ToolTip="Submit Details" ButtonType="StandardButton" ></telerik:RadButton>
                                                                                                                                                       
                                                                                                                                                        &nbsp;
                                                                                                                                                           <telerik:RadButton ID="clearbutton" runat="server" OnClick="clearbutton_click" Text="Clear" ToolTip="clear Details" ButtonType="StandardButton" ></telerik:RadButton>
                                                                                                                                                   &nbsp;
                                                                                                                                                   <telerik:RadButton ID="ViewGridID" runat="server" OnClientClicked="OnClientClicked" AutoPostBack="true" Text="ViewGrid" ToolTip="ViewGrid" ButtonType="StandardButton" ></telerik:RadButton>
                                                                                                                                                  
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
                                                                                                                                                    <td align="left" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                    <td align="left" class="style2" colspan="3" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                </tr>
                                                                                                                                                
                                                                                                                                                <tr><td colspan="3" height="80"></td></tr>
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
