public with sharing class UseCaseEleven {
    public static string showFullForm(string acronym){
        List<Acronym_Master__c> acronyms = [select id, full_form__c from Acronym_Master__c where name=: acronym limit 1];
        if(acronyms.size() ==1){
            return acronyms[0].full_form__c;
        }
        return 'Nothing found';
    }
}