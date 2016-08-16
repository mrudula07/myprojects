<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Main.Master" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="ChurchRecordkeeping.UserScreens.report" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <table><tr><td height="20px"></td></tr></table>
    <table border="0.5" frame="border" >
    <tr>
    <td >
<table>
                                                                                                                                              
                                                                                                                                              
                                                                                                                                           <tr>
                                                                                                                <td align="left" valign="top" width="10" background="../../images/04.gif">
                                                                                                                </td>
                                                                                                                <td align="left" valign="middle" width="791" >
                                                                                                                    <table align="left" border="0" cellpadding="0" cellspacing="0" width="791">
                                                                                                                    <tr>
                                                                                                                    <td colspan="7" align="center">
                                                                                                                    <asp:Label ID="lblErrorMsg" runat="server" Text="" CssClass="label_errormessage"
                                                                    Visible="true"></asp:Label></td>
                                                                                                                    </tr>
                                                                                                                        <tr>
                                                                                                                        
                                                                                                                            <td align="left" valign="top" width="200" colspan="7" height="12" style="padding-left:55px;">
                                                                                                                             <font class="gray-page-title">Report</font>
                                                                                                                            </td>
                                                                                                                           
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td align="left" valign="top" width="12">
                                                                                                                            </td>
                                                                                                                            <td align="right" valign="middle" width="767">
                                                                                                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="791">
                                                                                                                                  
                                                                                                                                    <tr>
                                                                                                                                        <td align="left" valign="top" width="791" colspan="5" height="12">
                                                                                                                                        
                                                                                                                                        </td>
                                                                                                                                    </tr>
                                                                                                                                    <tr>
                                                                                                                                        <td align="right" valign="top" width="150">
                                                                                                                                            <font class="news-font01">From Date:</font>&nbsp;
                                                                                                                                        </td>
                                                                                                                                        <td align="left" valign="top" width="283">
                                                                                                                                            <telerik:raddatetimepicker ID="FromDateTimePicker" runat="server" MinDate="1900-01-01"
                                                                                                                                                Skin="Vista" Width="240px">
                                                                                                                                                <Calendar ID="Calendar3" runat="server" RangeMinDate="1900-01-01" Skin="Windows7">
                                                                                                                                                </Calendar>
                                                                                                                                                <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                                                                                                                                <DateInput ID="Dateinput3" DateFormat="MM/dd/yyyy" runat="server" DisplayDateFormat="MM/dd/yyyy">
                                                                                                                                                </DateInput>
                                                                                                                                                <TimeView CellSpacing="-1" runat="server">
                                                                                                                                                </TimeView>
                                                                                                                                                <TimePopupButton Visible="false" />
                                                                                                                                            </telerik:raddatetimepicker>
                                                                                                                                        </td>
                                                                                                                                        <td align="left" valign="top" width="20">
                                                                                                                                        </td>
                                                                                                                                        <td align="right" valign="top" width="100" nowrap="nowrap">
                                                                                                                                            <font class="news-font01">To Date:</font>&nbsp;
                                                                                                                                        </td>
                                                                                                                                        <td align="left" valign="top" width="284">
                                                                                                                                            <telerik:raddatetimepicker ID="ToDateTimePicker" runat="server" MinDate="1900-01-01"
                                                                                                                                                Skin="Vista" Width="220px">
                                                                                                                                                <Calendar ID="Calendar4" runat="server" RangeMinDate="1900-01-01" Skin="Windows7">
                                                                                                                                                </Calendar>
                                                                                                                                                <DatePopupButton HoverImageUrl="" ImageUrl="" />
                                                                                                                                                <DateInput ID="Dateinput4" DateFormat="MM/dd/yyyy" runat="server" DisplayDateFormat="MM/dd/yyyy">
                                                                                                                                                </DateInput>
                                                                                                                                                <TimeView runat="server" CellSpacing="-1">
                                                                                                                                                </TimeView>
                                                                                                                                                <TimePopupButton Visible="false" />
                                                                                                                                            </telerik:raddatetimepicker>
                                                                                                                                        </td>
                                                                                                                                    </tr>
                                                                                                                                    <tr><td height="10px"></td></tr>
                                                                                                                                     <tr>
                                                                                                                                        <td align="right" valign="top" width="170"  >
                                                                                                                                            <font class="news-font01">MemberName:</font>&nbsp;
                                                                                                                                        </td>
                                                                                                                                        <td align="left" valign="top" width="283">
                                                                                                                                            <telerik:RadTextBox ID="FirstnameIDtxtbox" runat="server" EmptyMessage="Enter Firstname" CssClass="text-box-yellow" Width="215px"></telerik:RadTextBox>
                                                                                                                                        </td>
                                                                                                                                        <td align="left" valign="top" width="20">
                                                                                                                                        </td>
                                                                                                                                        <td align="right" valign="top" width="100" nowrap="nowrap">
                                                                                                                                            <font class="news-font01"></font>&nbsp;
                                                                                                                                        </td>
                                                                                                                                        <td align="left" valign="top" width="284">
                                                                                                                                            
                                                                                                                                        </td>
                                                                                                                                    </tr>
                                                                                                                                   
                                                                                                                                    <tr>
                                                                                                                                        <td align="left" valign="top" width="55">
                                                                                                                                            &nbsp;
                                                                                                                                        </td>
                                                                                                                                        <td align="left" valign="top" width="283">
                                                                                                                                            &nbsp;
                                                                                                                                        </td>
                                                                                                                                        <td align="left" valign="top" width="20">
                                                                                                                                            &nbsp;
                                                                                                                                        </td>
                                                                                                                                        <td align="left" valign="top" width="100">
                                                                                                                                            &nbsp;
                                                                                                                                        </td>
                                                                                                                                        <td align="left" valign="top" width="284">
                                                                                                                                            &nbsp;
                                                                                                                                        </td>
                                                                                                                                    </tr>
                                                                                                                                    
                                                                                                                                    <tr>
                                                                                                                                       
                                                                                                                                        <td align="right" valign="top" colspan="5" Width="600" style="padding-right:39px;">
                                                                                                                                         <telerik:RadButton ID="ViewButton" runat="server" Text="View" ToolTip="Submit Details" OnClick="ViewButton_onclick" AutoPostBack="true" ButtonType="StandardButton" ></telerik:RadButton>
                                                                                                                                                       
                                                                                                                                                        &nbsp;
                                                                                                                                                           <telerik:RadButton ID="RadButton2" runat="server" Text="Clear" ToolTip="Clear Details" OnClick="ClearButton_Click" ButtonType="StandardButton" ></telerik:RadButton>
                                                                                                                                                  
                                                                                                                                               
                                                                                                                                      
                                                                                                                                        </td>
                                                                                                                                    </tr>
                                                                                                                                   
                                                                                                                                    
                                                                                                                                </table>
                                                                                                                            </td>
                                                                                                                            <td align="left" valign="top" width="12">
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td align="left" valign="top" width="700" colspan="3" height="30">
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                    </table>
                                                                                                                </td>
                                                                                                                <td align="left" valign="top" width="10" background="../../images/03.gif">
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                                                                <tr>
                                                                                                                                                <td align="right" style="padding-right:60px;" width="600" colspan="4"> &nbsp;
                                                                                                                                                 <asp:ImageButton ID="ImageButton4" runat="server" Height="20px" ToolTip="Print"
                                                                                                                                OnClick="DownloadPDF_Click"    ImageUrl="~/Images/imageprint.png"></asp:ImageButton>&nbsp;
                                                       <%-- <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" ToolTip="Apply Search Criteria"
                                                            ImageUrl="~/Images/icon-search.jpg"></asp:ImageButton>&nbsp;
                                                        <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" ToolTip="Clear Filter Criteria"
                                                             ImageUrl="~/Images/icon-clear.jpg"></asp:ImageButton>--%></td>
                                                             </tr>

                                                                                                                                                <tr><td align="center" width="730" style="padding-left: 10px;"colspan="3" >
                                                                                                                                                <telerik:radgrid ID="gvmember" runat="server" AllowPaging="True"  Width="700" CssClass="RadGrid_Windows7 .rgHeader"
                                                                                                                             AllowSorting="True" AutoGenerateColumns="False" CellSpacing="0"  GridLines="Both"
                                                                                                                              GroupPanel-PanelStyle-BorderWidth="0"  OnPdfExporting="PDf_exporting"
                                                                                                                             OnNeedDataSource="CouponTitle_NeedDataSource" 
                                                                                                                            
                                                                                                                             PagerStyle-AlwaysVisible="true" PagerStyle-Mode="NumericPages" 
                                                                                                                             PagerStyle-ShowPagerText="true" PageSize="5">
                                                                                                                              <ItemStyle CssClass="Grid_itemstyle" />
                                                                                                                               <AlternatingItemStyle BackColor="#dcedf4"  CssClass="Grid_itemstyle"/>
                                                                                                                             <FilterMenu EnableImageSprites="true">
                                                                                                                             </FilterMenu>
                                                                                                                             <ClientSettings>
                                                                                                                                 <Selecting AllowRowSelect="false" />
                                                                                                                             </ClientSettings>
                                                                                                                            <ExportSettings HideStructureColumns="false" IgnorePaging="true" FileName="Donation Details"    
                                                                                                                                        OpenInNewWindow="true" ExportOnlyData="false" Excel-Format="Html" Pdf-Author="Sapna Patil" Pdf-Creator="Church Secretory" Pdf-DefaultFontFamily="Arial" Pdf-FontType="Embed" Pdf-Keywords="Mens" Pdf-PageBottomMargin="45" Pdf-PageFooterMargin="29">
                                                                                                                                        <Pdf PageHeight="210mm" PageWidth="297mm" DefaultFontFamily="Arial Unicode MS" PageTopMargin="45mm" PageTitle="Donation Details"   >
                                                                                                                                        
                                                                                                                                      </Pdf>
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
                                                                                                                                      <telerik:GridBoundColumn DataField="Envelopenumber" AllowFiltering="true" HeaderStyle-Font-Size="Medium"
                                                                                                                                         FilterControlAltText="Filter Envelopenumber column" HeaderText="Envelope No." 
                                                                                                                                         UniqueName="Envelopenumber" Visible="True">
                                                                                                                                           <HeaderStyle Font-Bold="false" HorizontalAlign="Left" Width="150px" Height="14px" />
                                                                                                                                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                                                                                                    
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                      <telerik:GridBoundColumn DataField="Firstname"  AllowFiltering="true" HeaderStyle-Font-Size="Medium"
                                                                                                                                         FilterControlAltText="Filter Firstname column" HeaderText="Member Name" 
                                                                                                                                         UniqueName="Firstname" Visible="True">
                                                                                                                                           <HeaderStyle Font-Bold="false" HorizontalAlign="Left" Width="150px" Height="14px" />
                                                                                                                                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                                                                                                    
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                       <telerik:GridBoundColumn DataField="Amount"  AllowFiltering="true" HeaderStyle-Font-Size="Medium"
                                                                                                                                         FilterControlAltText="Filter Amount column" HeaderText="Amount" 
                                                                                                                                         UniqueName="Amount" Visible="True">
                                                                                                                                           <HeaderStyle Font-Bold="false" HorizontalAlign="Left" Width="150px" Height="14px" />
                                                                                                                                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                                                                                                    
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                     <telerik:GridBoundColumn DataField="FundName"  AllowFiltering="true" HeaderStyle-Font-Size="Medium"
                                                                                                                                         FilterControlAltText="Filter FundName column" 
                                                                                                                                         HeaderText="Fund Type" UniqueName="FundName" Visible="True">
                                                                                                                                         <HeaderStyle Font-Bold="false" HorizontalAlign="Left" Width="150px" Height="14px" />
                                                                                                                                         <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="150px" />
                                                                                                                                     </telerik:GridBoundColumn>
                                                                                                                                    
                                                                                                                                    
                                                                                                                                     <telerik:GridTemplateColumn FilterControlAltText="Filter column2 column" Visible="false"
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
                                                                                                                                     <telerik:GridTemplateColumn HeaderTooltip="Delete" Visible="false" HeaderImageUrl="~/Images/Delete_Red.gif" AllowFiltering="false">
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
                                                                                                                         </telerik:radgrid>         
                                                                                                                                                </td></tr>
                                                                                                                                                </table>
  </td>
    </tr>                                                                                                                                          
  </table>
</asp:Content>
