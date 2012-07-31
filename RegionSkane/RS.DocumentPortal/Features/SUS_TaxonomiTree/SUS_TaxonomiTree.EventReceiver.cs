using System;
using System.Runtime.InteropServices;
using System.Security.Permissions;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Security;
using RS.DocumentPortal.Utilities.OrganizationalHierarchy;

namespace RS.DocumentPortal.Features.Feature1
{   

    [Guid("4a9d0594-987b-4e75-ae84-265e348c11e2")]
    public class Feature1EventReceiver : SPFeatureReceiver
    {
        public override void FeatureActivated(SPFeatureReceiverProperties properties)
        {
           SUSTermSet termset =  SUSOrganizationFields.ReturnSUSOrganizationHierarchy();
        }
    }
}
