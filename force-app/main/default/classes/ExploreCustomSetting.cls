public  class ExploreCustomSetting {
    public static decimal retrievePricing(){
        //[SELECT Id, Name, Pricing__c FROM InventoryPricing__c];

        system.debug('Org Default' + InventoryPricing__C.getOrgDefaults());
        system.debug('Instance Default' + InventoryPricing__C.getInstance());
        system.debug('Instance Default' + InventoryPricing__C.getInstance(Userinfo.getUserId()));
        system.debug('Values Default' + InventoryPricing__C.getValues(Userinfo.getUserId()));

        return 0; 
    }
}