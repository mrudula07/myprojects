<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDonation.aspx.cs" Inherits="ChurchRecordkeeping.UserScreens.ViewDonation" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
         <link href="~/Style/site.css" rel="stylesheet" type="text/css" />
    <link href="~/Style/custom.css" rel="stylesheet" type="text/css" />
        <link href="~/Style/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div style="background-color: #FFFFFF">
     <table align="center" border="0" cellpadding="0" cellspacing="0" width="807" 
            style="height: 675px">
                    <tr>
                       <%-- <td align="left" valign="top">
                        </td>--%>
                        <td align="left" valign="middle"  colspan="4">
                        <table><tr>
                        <td align="left" width="500" bgcolor="White" style="padding-left:50px;">
                         <font class="gray-page-title">View Donations</font>
                        </td>
                        <td align="right" style="padding-left:80px;">
                        <telerik:RadDatePicker ID="RadDatePicker" runat="server" Width="100px" Skin="Vista" AutoPostBack="true" OnSelectedDateChanged= "RadDatePicker_SelectedDateChanged"
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
                        <td align="left" colspan="3" height="6" valign="top" width="100%" 
                            style="background-color: #FFFFFF">
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
                            <table align="center"  cellpadding="0" cellspacing="0" border="0" width="800">
                            <tr>
                            <td bgcolor="White">
                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="767">
																						                                                        <tr>
																						                                                            <td align="left" valign="top" width="767" colspan="4"></td>
																						                                                        </tr>
																						                                                     
                                                                                                                                                <tr><td colspan="4">
                                                                                                                                                <table>
                                                                                                                                                <tr>
                                                                                                                                                <td align="right" style="padding-right:30px;" width="600"> <asp:ImageButton ID="ImageButton4" runat="server" Height="20px" ToolTip="Print"
                                                        Visible="false"    ImageUrl="~/Images/imageprint.png"></asp:ImageButton>&nbsp;
                                                        <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ToolTip="Apply Search Criteria" OnClick="SearchButton_Click"
                                                            ImageUrl="~/Images/icon-search.jpg"></asp:ImageButton>&nbsp;
                                                        <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" ToolTip="Clear Filter Criteria" OnClick="ResetButton_Click"
                                                             ImageUrl="~/Images/icon-clear.jpg"></asp:ImageButton></td></tr>

                                                                                                                                                <tr><td align="center" width="767" style="padding-left: 10px;" >
                                                                                                                                                <telerik:RadGrid ID="gvdonation" runat="server" AllowPaging="True"  Width="695" CssClass="RadGrid_Windows7 .rgHeader"
                                                                                                                             AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" AllowFilteringByColumn="true" 
                                                                                                                             GridLines="None" GroupPanel-PanelStyle-BorderWidth="0" 
                                                                                                                             OnNeedDataSource="gvdonation_NeedDataSource" OnItemCommand="GridFund_ItemCommand"
                                                                                                                            
                                                                                                                             PagerStyle-AlwaysVisible="true" PagerStyle-Mode="NumericPages" 
                                                                                                                             PagerStyle-ShowPagerText="false" PageSize="5">
                                                                                                                              <ItemStyle CssClass="Grid_itemstyle" />
                                                                                                                               <AlternatingItemStyle BackColor="#dcedf4"  CssClass="Grid_itemstyle"/>
                                                                                                                             <FilterMenu EnableImageSprites="true">
                                                                                                                             </FilterMenu>
                                                                                                                             <ClientSettings>
                                                                                                                                 <Selecting AllowRowSelect="false" />
                                                                                                                             </ClientSettings>
                                                                                                                             <ExportSettings HideStructureColumns="false" IgnorePaging="true" FileName="Donation Details"
                                                                                                                                        OpenInNewWindow="true" ExportOnlyData="true" Excel-Format="Html">
                                                                                                                                    </ExportSettings>
                                                                                                                             <MasterTableView>
                                                                                                                                 <CommandItemSettings ExportToPdfText="Export to Pdf" ShowExportToPdfButton="true" ShowRefreshButton="true"  />
                                                                                                                                 <RowIndicatorColumn>
                                                                                                                                     <HeaderStyle Width="25px" />
                                                                                                                                 </RowIndicatorColumn>
                                                                                                                                 <ExpandCollapseColumn>
                                                                                                                                     <HeaderStyle Width="25px" />
                                                                                                                                 </ExpandCollapseColumn>
                                                                                                                                 <Columns>

                                                                                                                                 					
                                                                                                                                     <telerik:GridBoundColumn DataField="Envelopenumber" AllowFiltering="true" ShowFilterIcon="false" 
                                                                                                                                         FilterControlAltText="Filter Envelopenumber column" HeaderText="Envelope No." DataType="System.Int32"
                                                                                                                                         UniqueName="Envelopenumber" Visible="True">
                                                                                                                                          <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="150px" />
                                                                                                                                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                      <telerik:GridBoundColumn DataField="Firstname"  AllowFiltering="true" ShowFilterIcon="false"
                                                                                                                                         FilterControlAltText="Filter Firstname column" HeaderText="Member Name" 
                                                                                                                                         UniqueName="Firstname" Visible="True">
                                                                                                                                          <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="150px" />
                                                                                                                                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                       <telerik:GridBoundColumn DataField="FundName"  AllowFiltering="true" ShowFilterIcon="false"
                                                                                                                                         FilterControlAltText="Filter FundName column" HeaderText="Fund Type" 
                                                                                                                                         UniqueName="FundName" Visible="True">
                                                                                                                                          <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="150px" />
                                                                                                                                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                         <telerik:GridBoundColumn DataField="DID"  AllowFiltering="true" ShowFilterIcon="false"
                                                                                                                                         FilterControlAltText="Filter DID column" HeaderText="DID" 
                                                                                                                                         UniqueName="DID" Visible="false">
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                      <%--  <telerik:GridBoundColumn DataField="FundNumber"  AllowFiltering="true" ShowFilterIcon="false"
                                                                                                                                         FilterControlAltText="Filter FundNumber column" HeaderText="Fund Type" 
                                                                                                                                         UniqueName="FundNumber" Visible="false">
                                                                                                                                     </telerik:GridBoundColumn>--%>
                                                                                                                                     <telerik:GridBoundColumn DataField="Moneytype"  AllowFiltering="true" ShowFilterIcon="false"
                                                                                                                                         FilterControlAltText="Filter Moneytype column" 
                                                                                                                                         HeaderText="Moneytype " UniqueName="Moneytype" Visible="True">
                                                                                                                                         <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="150px" />
                                                                                                                                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                     <telerik:GridBoundColumn DataField="Amount"  AllowFiltering="true" ShowFilterIcon="false"
                                                                                                                                         FilterControlAltText="Filter Amount column" HeaderText="Amount"  DataType="System.Int32"
                                                                                                                                         UniqueName="Amount" Visible="True">
                                                                                                                                          <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="150px" />
                                                                                                                                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                                                                                                    
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                     <telerik:GridDateTimeColumn  DataField="Date" Visible="false" UniqueName="Date" ShowFilterIcon="false"> 
                                                                                                                                     </telerik:GridDateTimeColumn>
                                                                                                                                    
                                                                                                                                     <telerik:GridTemplateColumn FilterControlAltText="Filter column2 column" 
                                                                                                                                         HeaderText="Edit" HeaderTooltip="Edit" UniqueName="column2" AllowFiltering="false">
                                                                                                                                         <EditItemTemplate>
                                                                                                                                             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                                                                                                         </EditItemTemplate>
                                                                                                                                         <ItemTemplate>
                                                                                                                                             <asp:ImageButton ID="ImageButton1" runat="server" CommandName="EditDonation" 
                                                                                                                                                 ImageUrl="~/Images/Edit.gif" />
                                                                                                                                         </ItemTemplate>
                                                                                                                                         <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="5%" />
                                                                                                                                         <ItemStyle VerticalAlign="Top" Width="5%" />
                                                                                                                                     </telerik:GridTemplateColumn>
                                                                                                                                     <telerik:GridTemplateColumn HeaderTooltip="Delete" HeaderText="Delete" AllowFiltering="false">
                                                                                                                                         <ItemTemplate>
                                                                                                                                             <ajaxtoolkit:ConfirmButtonExtender ID="ConfirmButton" runat="server" 
                                                                                                                                                 ConfirmText="Are you sure you want to delete?" 
                                                                                                                                                 TargetControlID="DeleteLinkButton" />
                                                                                                                                             <asp:ImageButton ID="DeleteLinkButton" runat="server" CommandName="Delete" 
                                                                                                                                                 ImageUrl="~/Images/Delete_Red.gif" />
                                                                                                                                         </ItemTemplate>
                                                                                                                                         <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="5%" />
                                                                                                                                         <ItemStyle VerticalAlign="Top" Width="5%" />
                                                                                                                                     </telerik:GridTemplateColumn>
                                                                                                                                 </Columns>
                                                                                                                                 <EditFormSettings>
                                                                                                                                     <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                                                                                                                     </EditColumn>
                                                                                                                                 </EditFormSettings>
                                                                                                                                 
                                                                                                                             </MasterTableView>
                                                                                                                         </telerik:RadGrid>         
                                                                                                                                                </td></tr></table></td></tr>
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
