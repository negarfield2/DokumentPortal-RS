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

    public class SUSTerm
    {
        public string DefaultLabel, Description, Language, Url;
        public bool Hidden = false, AvailableForTagging;
        public List<string> Labels;
    }

    public class Avdelning
    {
        public SUSTerm term;
    }

    public class Klinik
    {
        public SUSTerm term;
        public List<Avdelning> Avdelningar;     
    }

    public class Division
    {
        public SUSTerm term;
        public List<Klinik> Kliniker;        
    }

    public class Sjukhus
    {
        public SUSTerm term;
        public List<Division> Divisioner;        
    }

    public class Region
    {
        public string Name, Description, Language, Url;
        public bool Hidden= false, AvailableForTagging;
        public List<Sjukhus> Sjukhus;
    }

    public class SUSTermSet
    {
        public string Name, Description;
        public bool AvailableForTagging;
        public Region RegionSkane;
    }

    public static class SUSOrganizationFields
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

        public static SUSTermSet ReturnSUSOrganizationHierarchy()
        {            
            string configFilePath = SPUtility.GetGenericSetupPath(SUSOrganizationXMLPath);
            XDocument susSource = XDocument.Load(configFilePath);
            SUSTermSet regionSkane = LoadTermSet(susSource.Descendants("TermSets").Elements("TermSet"));
           
            return regionSkane;
        }

        private static SUSTermSet LoadTermSet(IEnumerable<XElement> termsets)
        {
            List<SUSTermSet> susTermsets = termsets.Select(x => new SUSTermSet()
            {                
                Description = x.Element(SUSOrganizationFields.Description).Value,                
                Name= x.Element(SUSOrganizationFields.Name).Value,
                RegionSkane =  LoadRegion(x.Elements("Term"))               
            }).ToList();

            return (susTermsets.Count > 0) ? susTermsets[0] : null;
        }

        private static Region LoadRegion(IEnumerable<XElement> term)
        {
            List<Region> regions = term.Select(x => new Region()
            {
                AvailableForTagging = Convert.ToBoolean(x.Element(SUSOrganizationFields.AvailableForTagging).Value),
                Description = x.Element(SUSOrganizationFields.Description).Value,
                Name = x.Element(SUSOrganizationFields.DefaultLabel).Value,
                Language = x.Element(SUSOrganizationFields.Language).Value,
                Url = x.Element(SUSOrganizationFields.Url).Value,
                Hidden = Convert.ToBoolean(x.Element(SUSOrganizationFields.Navigation).Value),
                Sjukhus = LoadSjukhus(x.Elements("Terms").Elements("Term"))

            }).ToList();
            
            return (regions.Count > 0) ? regions[0] : null;
        }

        private static List<Sjukhus> LoadSjukhus(IEnumerable<XElement> terms)
        {
            return terms.Select(x => new Sjukhus()
            {
                term = ReturnSUSTerm(x),
                Divisioner = LoadDivisions(x.Elements("Terms").Elements("Term"))

            }).ToList();                      
        }

        private static List<Division> LoadDivisions(IEnumerable<XElement> terms)
        {
            return terms.Select(x => new Division()
            {
                term = ReturnSUSTerm(x),
                Kliniker = LoadKliniks(x.Elements("Terms").Elements("Term"))

            }).ToList();

        }

        private static List<Klinik> LoadKliniks(IEnumerable<XElement> terms)
        {
            return terms.Select(x => new Klinik()
            {
                term = ReturnSUSTerm(x),
                Avdelningar = LoadAvdelning(x.Elements("Terms").Elements("Term"))

            }).ToList();

        }

        private static List<Avdelning> LoadAvdelning(IEnumerable<XElement> terms)
        {
            return terms.Select(x => new Avdelning()
            {
                term = ReturnSUSTerm(x)  
          
            }).ToList();
        }

        private static SUSTerm ReturnSUSTerm(XElement term)
        {
            SUSTerm susTerm = new SUSTerm();
            susTerm.AvailableForTagging = Convert.ToBoolean(term.Element(SUSOrganizationFields.AvailableForTagging).Value);
            susTerm.Description = term.Element(SUSOrganizationFields.Description).Value;
            susTerm.DefaultLabel = term.Element(SUSOrganizationFields.DefaultLabel).Value;
            susTerm.Language = term.Element(SUSOrganizationFields.Language).Value;
            susTerm.Url = term.Element(SUSOrganizationFields.Url).Value;
            susTerm.Hidden = Convert.ToBoolean(term.Element(SUSOrganizationFields.Navigation).Value);
            susTerm.Labels = LoadLabels(term.Elements("Labels").Elements("Label"));
            return susTerm;
        }

        private static List<string> LoadLabels(IEnumerable<XElement> labels)
        {
            return labels.Select(x => x.Value).ToList();
        }

    }
}
