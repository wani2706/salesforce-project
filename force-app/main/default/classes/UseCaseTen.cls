public class UseCaseTen {
    public static String checkPlantType(String plantName) {
        if (!String.isBlank(plantName)) {
            List<Plant_Information_Master__mdt> plantNames = [
                SELECT Id, MasterLabel, Plant_type__c FROM Plant_Information_Master__mdt
            ];
            for (Plant_Information_Master__mdt plant : plantNames) {
                if (plant.MasterLabel == plantName) {
                    return plant.Plant_type__c;
                }
            }
        }
        return '';
    }
}