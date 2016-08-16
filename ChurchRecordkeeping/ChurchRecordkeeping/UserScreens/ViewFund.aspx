<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewFund.aspx.cs" Inherits="ChurchRecordkeeping.UserScreens.ViewFund" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
         <link href="~/Style/site.css" rel="stylesheet" type="text/css" />
    <link href="~/Style/custom.css" rel="stylesheet" type="text/css" />
        <link href="~/Style/style.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#ffffff">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div style="background-color: #FFFFFF">
     <table align="center" border="0" cellpadding="0" cellspacing="0" width="807" 
            style="height: 583px">
                    <tr>
                       <%-- <td align="left" valign="top">
                        </td>--%>
                        <td align="left" valign="middle"  colspan="4">
                        <table><tr>
                        <td align="center" width="400" bgcolor="White" style="padding-right:20px;">
                         <font class="gray-page-title">View Funds</font>
                        </td>
                        <td align="right" style="padding-left:80px;">
                        
                       
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
                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="600">
																						                                                        <tr>
																						                                                            <td align="left" valign="top" width="767" colspan="4"></td>
																						                                                        </tr>
																						                                                     
                                                                                                                                                <tr><td colspan="4">
                                                                                                                                                <table>
                                                                                                                                                <tr>
                                                                                                                                                <td align="right" style="padding-right:45px;" width="550">
                                                                                                                                                 <asp:ImageButton ID="DownloadPDF" Visible="false" runat="server" Height="20px" OnClick="DownloadPDF_Click" ImageUrl="~/Images/imageprint.png"
            CssClass="pdfButton"></asp:ImageButton>&nbsp;
                                                        <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ToolTip="Apply Search Criteria" OnClick="SearchButton_Click"
                                                            ImageUrl="~/Images/icon-search.jpg"></asp:ImageButton>&nbsp;
                                                        <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" ToolTip="Clear Filter Criteria" OnClick="ResetButton_Click"
                                                             ImageUrl="~/Images/icon-clear.jpg"></asp:ImageButton></td></tr>

                                                                                                                                                <tr><td align="center" width="767" style="padding-left: 10px;" >
                                                                                                                                                <telerik:RadGrid ID="gvfund" runat="server" AllowPaging="True"  Width="500" CssClass="RadGrid_Windows7 .rgHeader"
                                                                                                                             AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0"   AllowFilteringByColumn ="true" 
                                                                                                                             GridLines="None" GroupPanel-PanelStyle-BorderWidth="0" OnItemCommand="GridFund_ItemCommand" 
                                                                                                                             OnNeedDataSource="CouponTitle_NeedDataSource" 
                                                                                                                            
                                                                                                                             PagerStyle-AlwaysVisible="true" PagerStyle-Mode="NumericPages" 
                                                                                                                             PagerStyle-ShowPagerText="false" PageSize="5">
                                                                                                                              <ItemStyle CssClass="Grid_itemstyle" />
                                                                                                                               <AlternatingItemStyle BackColor="#dcedf4"  CssClass="Grid_itemstyle"/>
                                                                                                                             <FilterMenu EnableImageSprites="true">
                                                                                                                             </FilterMenu>
                                                                                                                             <ClientSettings>
                                                                                                                                 <Selecting AllowRowSelect="false" />
                                                                                                                             </ClientSettings>
                                                                                                                             <ExportSettings HideStructureColumns="false" IgnorePaging="true" FileName="Layout Details"
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
                                                                                                                                     <telerik:GridBoundColumn DataField="FundNumber" AllowFiltering="true" ShowFilterIcon="false"
                                                                                                                                         FilterControlAltText="Filter FundNumber column" HeaderText="Fund Number" 
                                                                                                                                         UniqueName="FundNumber" Visible="True">
                                                                                                                                          <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="150px" />
                                                                                                                                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                      <telerik:GridBoundColumn DataField="FundName"  AllowFiltering="true" ShowFilterIcon="false"
                                                                                                                                         FilterControlAltText="Filter FundName column" HeaderText="Fund Name" 
                                                                                                                                         UniqueName="FundName" Visible="True">
                                                                                                                                          <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="150px" />
                                                                                                                                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                      
                                                                                                                                    
                                                                                                                                    
                                                                                                                                     <telerik:GridTemplateColumn FilterControlAltText="Filter column2 column"  HeaderText="Edit"
                                                                                                                                       HeaderTooltip="Edit" UniqueName="column2" AllowFiltering="false">
                                                                                                                                         <EditItemTemplate>
                                                                                                                                             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                                                                                                         </EditItemTemplate>
                                                                                                                                         <ItemTemplate>
                                                                                                                                             <asp:ImageButton ID="ImageButton1" runat="server" CommandName="EditFund" 
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
