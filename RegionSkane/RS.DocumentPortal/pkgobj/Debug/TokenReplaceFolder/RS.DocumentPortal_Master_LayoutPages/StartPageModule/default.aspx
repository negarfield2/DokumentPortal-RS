<%@ Register TagPrefix="WpNs0" Namespace="Microsoft.Office.Server.WebControls" Assembly="Microsoft.Office.DocumentManagement, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c"%>
<%-- _lcid="1033" _version="14.0.4758" _dal="1" --%>
<%-- _LocalBinding --%>
<%@ Page language="C#" MasterPageFile="~masterurl/custom.master"    Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage,Microsoft.SharePoint,Version=14.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:webpartpageexpansion="full" meta:progid="SharePoint.WebPartPage.Document"  %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint" %> <%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<asp:Content ID="Content1" ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
	<SharePoint:EncodedLiteral ID="EncodedLiteral1" runat="server" text="<%$Resources:wss,multipages_homelink_text%>" EncodeMethod="HtmlEncode"/> - 
	<SharePoint:ProjectProperty ID="ProjectProperty1" Property="Title" runat="server"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderId="PlaceHolderPageImage" runat="server"><img src="/_layouts/images/blank.gif" width='1' height='1' alt="" /></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderId="PlaceHolderPageTitleInTitleArea" runat="server">
			<label class="ms-hidden">
			<SharePoint:ProjectProperty ID="ProjectProperty2" Property="Title" runat="server"/></label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderId="PlaceHolderTitleAreaClass" runat="server">
<SharePoint:UIVersionedContent ID="UIVersionedContent1" runat="server" UIVersion="<=3">
	<ContentTemplate>
		<style type="text/css">
		td.ms-titleareaframe, .ms-pagetitleareaframe {
			height: 10px;
		}
		div.ms-titleareaframe {
			height: 100%;
		}
		.ms-pagetitleareaframe table {
			background: none;
			height: 10px;
		}
		</style>
	</ContentTemplate>
</SharePoint:UIVersionedContent>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderId="PlaceHolderAdditionalPageHead" runat="server">
	<meta name="CollaborationServer" content="SharePoint Team Web Site" />
<style type="text/css">
.s4-nothome {
	display:none;
}
</style>
	<script type="text/javascript">
// <![CDATA[
	    function ULS18u() { var o = new Object; o.ULSTeamName = "DLC Server"; o.ULSFileName = "default.aspx"; return o; }
	    var navBarHelpOverrideKey = "wssmain";
	    // ]]>
	    function OpenNewFormUrl(url) {
	        ULS18u: ;
	        var options = { width: 720, height: 480 };
	        SP.UI.ModalDialog.commonModalDialogOpen(url, options, null, null);
	    }
	</script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderId="PlaceHolderSearchArea" runat="server">
	<SharePoint:DelegateControl ID="DelegateControl1" runat="server"
		ControlId="SmallSearchInputBox"/>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderId="PlaceHolderLeftActions" runat="server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderId="PlaceHolderPageDescription" runat="server"/>
<asp:Content ID="Content9" ContentPlaceHolderId="PlaceHolderBodyAreaClass" runat="server">
<style type="text/css">
.ms-bodyareaframe {
	padding: 0px;
}
</style>
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderId="PlaceHolderMain" runat="server">
	<table cellspacing="0" border="0" width="100%">
	  <tr class="s4-die">
	   <td class="ms-pagebreadcrumb">
		  <asp:SiteMapPath SiteMapProvider="SPContentMapProvider" id="ContentMap" SkipLinkText="" NodeStyle-CssClass="ms-sitemapdirectional" runat="server"/>
	   </td>
	  </tr>
	  <tr>
		<td>
		 <table width="100%" class="ms-welcomepageheader" cellpadding="0" cellspacing="5" style="padding: 5px 10px 10px 10px;">
		   <td valign="top" width="80%">
			   <WebPartPages:WebPartZone runat="server" FrameType="TitleBarOnly" ID="TopLeft" Title="loc:Top_Left"><ZoneTemplate>

</ZoneTemplate></WebPartPages:WebPartZone>
		   </td>
		   <td valign="top" width="10%">
			   <WebPartPages:WebPartZone runat="server" FrameType="TitleBarOnly" ID="TopRight" Title="loc:Top_Right"><ZoneTemplate>
</ZoneTemplate></WebPartPages:WebPartZone>
		   </td>
		  </tr>
		 </table>
		</td>
	  </tr>
	  <tr>
		<td>
		 <table width="100%" cellpadding="0" cellspacing="5" style="padding: 5px 10px 10px 10px;">
		  <tr>
		   <td valign="top" width="50%">
			   <WebPartPages:WebPartZone runat="server" FrameType="TitleBarOnly" ID="BottomLeft" Title="loc:Bottom_Left"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>
		   </td>
		   <td valign="top" width="50%">
			   <%--<WebPartPages:WebPartZone runat="server" FrameType="TitleBarOnly" ID="Right" Title="loc:Right"><ZoneTemplate></ZoneTemplate></WebPartPages:WebPartZone>--%>
		   </td>
		  </tr>
		 </table>
		</td>
	  </tr>
	</table>
</asp:Content>
