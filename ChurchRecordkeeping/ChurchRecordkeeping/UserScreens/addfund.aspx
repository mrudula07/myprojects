<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="addfund.aspx.cs" Inherits="ChurchRecordkeeping.UserScreens.addfund" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
     <table align="center" border="0" cellpadding="0" cellspacing="0" width="907" bgcolor="#f4f4f4">
                    <tr>
                        <td align="left" valign="top">
                        </td>
                        <td align="left" valign="bottom" width="500" colspan="2" style="padding-left:20px;">
                         <font class="gray-page-title">Create/View/Edit Fund</font>
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
                            <table align="center"  cellpadding="0" cellspacing="0" border="0" width="907">
                            <tr>
                            <td bgcolor="#f4f4f4">
                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="767">
																						                                                        <tr>
																						                                                            <td align="left" valign="top" width="767" colspan="4"></td>
																						                                                        </tr>
																						                                                        <tr>
																						                                                            <td align="left" valign="top" width="158" style="padding-left:7%;">
                                                                                                                                                        <font class="news-font01">Fund Name<font class="red11">*</font>:</font></td>
																						                                                            <td align="left" valign="top" width="158">
                                                                                                                                                         <telerik:RadTextBox ID="FirstnameIDtxtbox" runat="server" EmptyMessage="Enter Fund Name" CssClass="text-box-yellow" Width="200px"></telerik:RadTextBox>

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
                                                                                                                                                        <font class="news-font01">Fund Number<font class="red11">*</font>:</font></td>
																						                                                            <td align="left" valign="top" width="158">
                                                                                                                                                        <telerik:RadComboBox ID="RadComboBoxState" EmptyMessage="---Select Fund No.---" runat="server" AutoPostBack="true" 
                                                                                                                                                            CssClass="textCombo-normal" 
                                                                                                                                                            Width="200px">
                                                                                                                                                        </telerik:RadComboBox>
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
                                                                                                                                                    <td align="right" class="style2"  valign="top" width="167" style="Padding-left:40px;">
                                                                                                                                                    <telerik:RadButton ID="RadButton1" runat="server" Text="Save" ToolTip="Submit Details" ButtonType="StandardButton" ></telerik:RadButton>
                                                                                                                                                       
                                                                                                                                                        &nbsp;
                                                                                                                                                           <telerik:RadButton ID="RadButton2" runat="server" Text="Clear" ToolTip="Clear Details" ButtonType="StandardButton" ></telerik:RadButton>
                                                                                                                                                  
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                </tr>
                                                                                                                                                <tr>
                                                                                                                                                    <td align="left" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                    <td align="right" valign="top" colspan="3" valign="top" width="158" style="padding-right:30px;">
                                                                                                                                                    
                                                                                                                                                    </td>
                                                                                                                                                </tr>
                                                                                                                                                 <tr>
                                                                                                                                                    <td align="left" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                    <td align="left" class="style2" colspan="3" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                </tr>
                                                                                                                                                <tr><td colspan="4">
                                                                                                                                                <table>
                                                                                                                                                <tr>
                                                                                                                                                <td align="right" style="padding-right:100px;" width="500"> <asp:ImageButton ID="ImageButton4" runat="server" Height="20px" ToolTip="Apply Search Criteria"
                                                            ImageUrl="~/Images/imageprint.png"></asp:ImageButton>&nbsp;
                                                        <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ToolTip="Apply Search Criteria"
                                                            ImageUrl="~/Images/icon-search.jpg"></asp:ImageButton>&nbsp;
                                                        <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" ToolTip="Clear Filter Criteria"
                                                             ImageUrl="~/Images/icon-clear.jpg"></asp:ImageButton></td></tr>
                                                                                                                                                <tr><td align="left" width="600" style="padding-left: 40px;" >
                                                                                                                                                <telerik:RadGrid ID="gvmember" runat="server" AllowPaging="True"  Width="500" CssClass="RadGrid_Windows7 .rgHeader"
                                                                                                                             AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0" 
                                                                                                                             GridLines="None" GroupPanel-PanelStyle-BorderWidth="0" 
                                                                                                                             OnNeedDataSource="CouponTitle_NeedDataSource" 
                                                                                                                            
                                                                                                                             PagerStyle-AlwaysVisible="true" PagerStyle-Mode="NumericPages" 
                                                                                                                             PagerStyle-ShowPagerText="false" PageSize="25">
                                                                                                                              <ItemStyle CssClass="Grid_itemstyle" />
                                                                                                                               <AlternatingItemStyle BackColor="#dcedf4"  CssClass="Grid_itemstyle"/>
                                                                                                                             <FilterMenu EnableImageSprites="true">
                                                                                                                             </FilterMenu>
                                                                                                                             <ClientSettings>
                                                                                                                                 <Selecting AllowRowSelect="false" />
                                                                                                                             </ClientSettings>
                                                                                                                            
                                                                                                                             <MasterTableView>
                                                                                                                                 <CommandItemSettings ExportToPdfText="Export to Pdf" ShowExportToPdfButton="true" ShowRefreshButton="true"  />
                                                                                                                                 <RowIndicatorColumn>
                                                                                                                                     <HeaderStyle Width="25px" />
                                                                                                                                 </RowIndicatorColumn>
                                                                                                                                 <ExpandCollapseColumn>
                                                                                                                                     <HeaderStyle Width="25px" />
                                                                                                                                 </ExpandCollapseColumn>
                                                                                                                                 <Columns>
                                                                                                                                     <telerik:GridBoundColumn DataField="PTitleID" AllowFiltering="true"
                                                                                                                                         FilterControlAltText="Filter PTitleID column" HeaderText="Fund Number" 
                                                                                                                                         UniqueName="PTitleID" Visible="True">
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                      <telerik:GridBoundColumn DataField="PTitleID"  AllowFiltering="true"
                                                                                                                                         FilterControlAltText="Filter PTitleID column" HeaderText="Fund Name" 
                                                                                                                                         UniqueName="PTitleID" Visible="True">
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                      
                                                                                                                                    
                                                                                                                                    
                                                                                                                                     <telerik:GridTemplateColumn FilterControlAltText="Filter column2 column" 
                                                                                                                                         HeaderImageUrl="~/Images/Edit.gif" HeaderTooltip="Edit" UniqueName="column2" AllowFiltering="false">
                                                                                                                                         <EditItemTemplate>
                                                                                                                                             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                                                                                                         </EditItemTemplate>
                                                                                                                                         <ItemTemplate>
                                                                                                                                             <asp:ImageButton ID="ImageButton1" runat="server" CommandName="EditTitle" 
                                                                                                                                                 ImageUrl="~/Images/Edit.gif" />
                                                                                                                                         </ItemTemplate>
                                                                                                                                         <HeaderStyle Font-Bold="true" HorizontalAlign="Left" Width="5%" />
                                                                                                                                         <ItemStyle VerticalAlign="Top" Width="5%" />
                                                                                                                                     </telerik:GridTemplateColumn>
                                                                                                                                     <telerik:GridTemplateColumn HeaderTooltip="Delete" HeaderImageUrl="~/Images/Delete_Red.gif" AllowFiltering="false">
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
                                                                                                                                                <tr><td colspan="3" height="10"></td></tr>
																						                                                    </table>
                            </td>
                            </tr>
                            </table>
                            </td>
                            </tr>
                            <tr><td height="20"></td></tr>
                    </table>
      
    </div>
</asp:Content>
