using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint.Utilities;
using System.Xml.Linq;

namespace RS.DocumentPortal.Utilities.OrganizationalHierarchy
{
    public enum NodeType
    {
        Avdelning,
        Klinik,
        Division,
        Sjukhus,
        Region
    }

    public class Avdelning
    {
        public string DefaultLabel, Description, Language, Url;
        public bool Hidden = false, AvailableForTagging;
        public List<string> Labels;
    }

    public class Klinik
    {
        public string DefaultLabel, Description, Language, Url;
        public bool Hidden = false, AvailableForTagging;      
        public List<Avdelning> Avdelningar;
        public List<string> Labels;
    }

    public class Division
    {
        public string DefaultLabel, Description, Language, Url;
        public bool Hidden = false, AvailableForTagging;       
        public List<Klinik> Kliniker;
        public List<string> Labels;
    }

    public class Sjukhus
    {
        public string DefaultLabel, Description, Language, Url;
        public bool Hidden= false, AvailableForTagging;
        public List<Division> Divisioner;
        public List<string> Labels;
    }

    public class Region
    {
        public string Name, Description, Url;
        public bool Hidden= false, AvailableForTagging;
        public List<Sjukhus> Sjukhus;
    }

    public class SUSOrganizationFields
    {
        public const string Name = "Name";
        public const string Description = "Description";
        public const string Url = "Url";
        public const string AvailableForTagging = "AvailableForTagging";
        public const string Navigation = "Navigation";
        public const string Label = "Label";
        public const string DefaultLabel = "DefaultLabel";
        public const string Language = "Language";


        public const string SUSOrganizationXMLPath = @"template/layouts/RS.DocumentPortal/TaxonomyMap/SUSOrganisation.xml";

        public static Region ReturnSUSOrganizationHierarchy()
        {
            Region regionSkane = new Region();
            string configFilePath = SPUtility.GetGenericSetupPath(SUSOrganizationXMLPath);
            XDocument susSource = XDocument.Load(configFilePath);
            //List<TemplateData> data = CollectTemplateData(susSource);
            //GenerateTemplateItems(web, templateList, data);

            return regionSkane;
        }
    }
}
