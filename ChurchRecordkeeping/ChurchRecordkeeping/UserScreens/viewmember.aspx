<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewmember.aspx.cs" Inherits="ChurchRecordkeeping.UserScreens.viewmember" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="~/Style/site.css" rel="stylesheet" type="text/css" />
    <link href="~/Style/custom.css" rel="stylesheet" type="text/css" />
     <link href="~/Style/style.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body style="background-color: #FFFFFF">
    <form id="form1" runat="server" style="background-color: #FFFFFF">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="700" >
                    <tr>
                        <td align="left" valign="top">
                        </td>
                        <td align="left" valign="middle" width="300"  style="padding-left:10px;">
                         <font  class="gray-page-title">View Member</font>
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
                        <td align="left" colspan="3" valign="top" width="100%">
                            <table align="center"  cellpadding="0" cellspacing="0" border="0" width="760">
                            <tr>
                            <td>
                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="767">
																						                                                        <tr>
																						                                                            <td align="left" valign="top" width="767" colspan="4"></td>
																						                                                        </tr>
																						                                                       
                                                                                                                                                <tr><td colspan="4">
                                                                                                                                                <table>
                                                                                                                                                <td align="right" style="padding-right:30px;" width="700">
                                                                                                                                                 &nbsp;
                                                           <%-- <asp:ImageButton ID="DownloadPDF" runat="server" Height="20px" OnClick="DownloadPDF_Click" ImageUrl="~/Images/imageprint.png"
            CssClass="pdfButton"></asp:ImageButton>--%>
                                                        <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ToolTip="Apply Search Criteria" OnClick="SearchButton_Click"
                                                            ImageUrl="~/Images/icon-search.jpg"></asp:ImageButton>&nbsp;
                                                        <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" ToolTip="Clear Filter Criteria" OnClick="ResetButton_Click"
                                                             ImageUrl="~/Images/icon-clear.jpg"></asp:ImageButton></td>
                                                                                                                                                <tr><td align="center" width="767" style="padding-left: 10px;" >
                                                                                                                                                <telerik:RadGrid ID="gvmember" runat="server" AllowPaging="True"  Width="695" CssClass="RadGrid_Windows7 .rgHeader"
                                                                                                                             AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" AllowFilteringByColumn ="true"  
                                                                                                                             GridLines="None" GroupPanel-PanelStyle-BorderWidth="0" 
                                                                                                                             OnNeedDataSource="CouponTitle_NeedDataSource" OnItemCommand="GridmEMBER_ItemCommand"
                                                                                                                            
                                                                                                                             PagerStyle-AlwaysVisible="true" PagerStyle-Mode="NumericPages" 
                                                                                                                             PagerStyle-ShowPagerText="false" PageSize="10">
                                                                                                                              <ItemStyle CssClass="Grid_itemstyle" />
                                                                                                                               <AlternatingItemStyle BackColor="#dcedf4"  CssClass="Grid_itemstyle"/>
                                                                                                                             <FilterMenu EnableImageSprites="false">
                                                                                                                             </FilterMenu>
                                                                                                                             <ClientSettings>
                                                                                                                                 <Selecting AllowRowSelect="false" />
                                                                                                                             </ClientSettings>
                                                                                                                             <ExportSettings HideStructureColumns="false" IgnorePaging="true" FileName="Layout Details"
                                                                                                                                        OpenInNewWindow="true" ExportOnlyData="true" Excel-Format="Html">
                                                                                                                                    </ExportSettings>
                                                                                                                             <MasterTableView>
                                                                                                                                 <CommandItemSettings ExportToPdfText="Export to Pdf"  ShowExportToPdfButton="true"  ShowRefreshButton="true"  />
                                                                                                                                 <RowIndicatorColumn>
                                                                                                                                     <HeaderStyle Width="25px" />
                                                                                                                                 </RowIndicatorColumn>
                                                                                                                                 <ExpandCollapseColumn>
                                                                                                                                     <HeaderStyle Width="25px" />
                                                                                                                                 </ExpandCollapseColumn>
                                                                                                                                 <Columns>
                                                                                                                                     <telerik:GridBoundColumn DataField="Firstname" AllowFiltering="true" ShowFilterIcon="false"
                                                                                                                                         FilterControlAltText="Filter Firstname column" HeaderText="Member Name" 
                                                                                                                                         UniqueName="Firstname" Visible="True">
                                                                                                                                           <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="150px" />
                                                                                                                                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                      <telerik:GridBoundColumn DataField="MID" AllowFiltering="true" ShowFilterIcon="false"
                                                                                                                                         FilterControlAltText="Filter MID column" HeaderText="MID" 
                                                                                                                                         UniqueName="MID" Visible="false">
                                                                                                                                           <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="150px" />
                                                                                                                                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                      <telerik:GridBoundColumn DataField="city"  AllowFiltering="true" ShowFilterIcon="false"
                                                                                                                                         FilterControlAltText="Filter city column" HeaderText="City" 
                                                                                                                                         UniqueName="city" Visible="True">
                                                                                                                                                                                                                                                                                  <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="150px" />
                                                                                                                                          <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="150px" />
                                                                                                                                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                       <telerik:GridBoundColumn DataField="state"  AllowFiltering="true" ShowFilterIcon="false"
                                                                                                                                         FilterControlAltText="Filter state column" HeaderText="State" 
                                                                                                                                         UniqueName="state" Visible="True">
                                                                                                                                                                                                                                                                                  <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="150px" />
                                                                                                                                          <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="150px" />
                                                                                                                                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                     <telerik:GridBoundColumn DataField="evid"  AllowFiltering="true" ShowFilterIcon="false"
                                                                                                                                         FilterControlAltText="Filter evid column" 
                                                                                                                                         HeaderText="Envelope Number" UniqueName="evid" Visible="True">
                                                                                                                                         <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="150px" />
                                                                                                                                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                    
                                                                                                                                    
                                                                                                                                     <telerik:GridTemplateColumn FilterControlAltText="Filter column2 column"  ShowFilterIcon="false"
                                                                                                                                         HeaderText="Edit" HeaderTooltip="Edit" UniqueName="column2" AllowFiltering="false">
                                                                                                                                         <EditItemTemplate>
                                                                                                                                             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                                                                                                         </EditItemTemplate>
                                                                                                                                         <ItemTemplate>
                                                                                                                                             <asp:ImageButton ID="ImageButton1" runat="server" CommandName="EditMember" 
                                                                                                                                                 ImageUrl="~/Images/Edit.gif" ToolTip="Edit" />
                                                                                                                                         </ItemTemplate>
                                                                                                                                         <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="5%" />
                                                                                                                                         <ItemStyle VerticalAlign="Top" Width="5%" />
                                                                                                                                     </telerik:GridTemplateColumn>
                                                                                                                                     <telerik:GridTemplateColumn HeaderTooltip="Delete" HeaderText="Delete" HeaderImageUrl="" AllowFiltering="false">
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
                                                                                                                                                <tr><td colspan="3" height="50"></td></tr>
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
