<%@ Page language="C#" MasterPageFile="~masterurl/default.master"  Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=14.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePointWebControls" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="PublishingNavigation" Namespace="Microsoft.SharePoint.Publishing.Navigation" Assembly="Microsoft.SharePoint.Publishing, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ID="Content1" ContentPlaceholderID="PlaceHolderPageTitle" runat="server">
	<SharePoint:ListItemProperty ID="ListItemProperty1" Property="Title" maxlength="40" runat="server"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceholderID="PlaceHolderAdditionalPageHead" runat="server">
	<SharePoint:CssRegistration ID="RSLayoutCss" name="<% $SPUrl:~SiteCollection/_layouts/RS.DocumentPortal/css/RSLayout.css%>" After="corev4.css" runat="server"/>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceholderID="PlaceHolderMain" runat="server">
    
       <table cellpadding="0" cellspacing="0"><tr>
       <td class="zonegap"></td>                                       
       <td class="zoneColumn">
        <div class="layout-top-left-zone">
            <WebPartPages:WebPartZone runat="server" Title="loc:Top" ID="TopLeft" FrameType="TitleBarOnly" class="layout-top-left-zone">
            <ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
        </div>
        </td>
        <td class="zonegap"></td>
        <td class="zoneColumn">
        <div class="layout-top-right-zone">
            <WebPartPages:WebPartZone runat="server" Title="loc:top-right-zone" ID="top-right-zone" FrameType="TitleBarOnly" class="layout-top-right-zone"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
        </div>
        </td>
        <td class="zonegap"></td>
        </tr>
        </table>

        <table>
        <tr>
        <td class="zoneColumn">
        <div class="layout-bottom-left-zone">
            <WebPartPages:WebPartZone runat="server" Title="loc:bottom-left-zone" ID="bottom-left-zone" FrameType="TitleBarOnly" class="layout-bottom-left-zone"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
        </div>
        </td>
        <td class="zonegap"></td>
       </tr>
       </table> 
    
</asp:Content>
