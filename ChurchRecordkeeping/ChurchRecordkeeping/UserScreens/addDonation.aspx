<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="addDonation.aspx.cs" Inherits="ChurchRecordkeeping.UserScreens.addDonation" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
     <table align="center" border="0" cellpadding="0" cellspacing="0" width="907" bgcolor="#f4f4f4">
                    <tr>
                       <%-- <td align="left" valign="top">
                        </td>--%>
                        <td align="left" valign="middle"  colspan="4">
                        <table><tr><td align="left" width="400">
                         <font class="gray-page-title">Create/View/Edit Records for Donation</font>
                        </td>
                        <td align="right" style="Padding-left:298px;">
                        <telerik:RadDatePicker ID="RadDatePicker" runat="server" Width="100px" Skin="Vista" 
                                                                         SelectedDate="2015-05-23">
                                                                <Calendar Skin="Vista" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" runat="server"
                                                                   ViewSelectorText="x">
                                                                   </Calendar>
                                                                  <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                                                   <DateInput DateFormat="M/d/yyyy" DisplayDateFormat="M/d/yyyy" EnableSingleInputRendering="True" runat="server"
                                                                  LabelWidth="64px" SelectedDate="2015-05-23">
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
                            <table align="center"  cellpadding="0" cellspacing="0" border="0" width="907">
                            <tr>
                            <td bgcolor="#f4f4f4">
                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="767">
																						                                                        <tr>
																						                                                            <td align="left" valign="top" width="767" colspan="4"></td>
																						                                                        </tr>
																						                                                        <tr>
																						                                                            <td align="left" valign="top" width="158" style="padding-left:7%;">
                                                                                                                                                        <font class="news-font01">Envelope No.<font class="red11">*</font>:</font></td>
																						                                                            <td align="left" valign="top" width="158">
                                                                                                                                                          <telerik:RadComboBox ID="RadComboBox1" EmptyMessage="---Select State---" runat="server" AutoPostBack="true" 
                                                                                                                                                            CssClass="textCombo-normal" 
                                                                                                                                                            Width="200px">
                                                                                                                                                        </telerik:RadComboBox>
                                                                                                                                                    </td>
																						                                                            <td align="center" valign="top" width="159">
                                                                                                                                                       <font class="news-font01">Amount<font class="red11">*</font>:</font> </td>
																						                                                            <td align="left" valign="top" width="225"> 
                                                                                                                                                    <telerik:RadTextBox ID="LastnameIDtxtbox" runat="server" EmptyMessage="Enter Amount" CssClass="text-box-yellow" Width="200px"></telerik:RadTextBox>

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
                                                                                                                                                        <telerik:RadComboBox ID="RadComboBox2" EmptyMessage="---Select Fund Name---" runat="server" AutoPostBack="true" 
                                                                                                                                                            CssClass="textCombo-normal" 
                                                                                                                                                            Width="200px">
                                                                                                                                                        </telerik:RadComboBox>
                                                                                                                                                    </td>
																						                                                            <td align="center" valign="top" width="159">
                                                                                                                                                       <font class="news-font01">Money Type<font class="red11">*</font>:</font> </td>
																						                                                            <td align="left" valign="top" width="225">
                                                                                                                                                      <telerik:RadComboBox ID="RadComboBox3" EmptyMessage="---Select Money Type---" runat="server" AutoPostBack="true" 
                                                                                                                                                            CssClass="textCombo-normal" 
                                                                                                                                                            Width="200px">
                                                                                                                                                        </telerik:RadComboBox>
                                                                                                                                            </td>
																						                                                        </tr>
																						                                                       
                                                                                                                                                
                                                                                                                                                <tr>
                                                                                                                                                    <td align="left" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                    <td align="left" class="style2" colspan="3" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                </tr>
                                                                                                                                                <tr>
                                                                                                                                                    <td align="left" valign="top" width="158">
                                                                                                                                                        &nbsp;</td>
                                                                                                                                                    <td align="right" valign="top" colspan="3" valign="top" width="158" style="padding-right:30px;">
                                                                                                                                                    <telerik:RadButton ID="RadButton1" runat="server" Text="Save" ToolTip="Submit Details" ButtonType="StandardButton" ></telerik:RadButton>
                                                                                                                                                       
                                                                                                                                                        &nbsp;
                                                                                                                                                           <telerik:RadButton ID="RadButton2" runat="server" Text="Clear" ToolTip="Submit Details" ButtonType="StandardButton" ></telerik:RadButton>
                                                                                                                                                  
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
                                                                                                                                                <tr><td colspan="4">
                                                                                                                                                <table>
                                                                                                                                                <tr>
                                                                                                                                                <td align="right" style="padding-right:30px;" width="600"> <asp:ImageButton ID="ImageButton4" runat="server" Height="20px" ToolTip="Apply Search Criteria"
                                                            ImageUrl="~/Images/imageprint.png"></asp:ImageButton>&nbsp;
                                                        <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ToolTip="Apply Search Criteria"
                                                            ImageUrl="~/Images/icon-search.jpg"></asp:ImageButton>&nbsp;
                                                        <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" ToolTip="Clear Filter Criteria"
                                                             ImageUrl="~/Images/icon-clear.jpg"></asp:ImageButton></td></tr>

                                                                                                                                                <tr><td align="center" width="767" style="padding-left: 10px;" >
                                                                                                                                                <telerik:RadGrid ID="gvmember" runat="server" AllowPaging="True"  Width="695" CssClass="RadGrid_Windows7 .rgHeader"
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
                                                                                                                                         FilterControlAltText="Filter PTitleID column" HeaderText="Envelope No." 
                                                                                                                                         UniqueName="PTitleID" Visible="True">
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                      <telerik:GridBoundColumn DataField="PTitleID"  AllowFiltering="true"
                                                                                                                                         FilterControlAltText="Filter PTitleID column" HeaderText="Member Name" 
                                                                                                                                         UniqueName="PTitleID" Visible="True">
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                       <telerik:GridBoundColumn DataField="PTitleID"  AllowFiltering="true"
                                                                                                                                         FilterControlAltText="Filter PTitleID column" HeaderText="Fund Type" 
                                                                                                                                         UniqueName="PTitleID" Visible="True">
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                     <telerik:GridBoundColumn DataField="SolutionGroupDesc"  AllowFiltering="true"
                                                                                                                                         FilterControlAltText="Filter SolutionGroupDesc column" 
                                                                                                                                         HeaderText="Fund Amount" UniqueName="SolutionGroupDesc" Visible="True">
                                                                                                                                         <HeaderStyle Font-Bold="false" HorizontalAlign="Left" Width="150px" />
                                                                                                                                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                     <telerik:GridBoundColumn DataField="PTitleID"  AllowFiltering="true"
                                                                                                                                         FilterControlAltText="Filter PTitleID column" HeaderText="Note" 
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
                                                                                                                                                <tr><td colspan="3" height="80"></td></tr>
																						                                                    </table>
                            </td>
                            </tr>
                            </table>
                            </td>
                            </tr>
                    </table>
      
    </div>
</asp:Content>

