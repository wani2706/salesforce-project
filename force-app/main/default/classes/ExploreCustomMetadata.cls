public class ExploreCustomMetadata {
    public static decimal retrievePricingPArity(string regionName){
        Decimal pricingParityIndex;
        //access the metadata records, fectch the pricing parity value for the given region
        
        if(!string.isblank(regionName)){
            List<Inventory_Pricing__mdt> pricingMdt = [SELECT Id, DeveloperName, MasterLabel, Region__c, Pricing_Parity__c FROM Inventory_Pricing__mdt where region__c =: regionName limit 1];
            if(pricingMdt.size() == 1){
                pricingParityIndex = pricingMdt[0].Pricing_Parity__c;
            }
            
        }
        
        
        return pricingParityIndex;
    }
}