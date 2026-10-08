public class LicenseAllocator {

    @AuraEnabled(cacheable=true)
    public static List<Profile> getProfileInfo(){
        try{
            List<Profile> userProfiles = [SELECT Id, Name, UserLicense.Name FROM Profile WHERE UserLicense.Name = 'Salesforce'];
            return userProfiles;
        }
        catch(Exception e){
            throw new AuraHandledException('Error occurred while fetching profile information' + e.getMessage());
        }
        
    }
}