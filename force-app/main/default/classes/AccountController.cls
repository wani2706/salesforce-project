public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> findAccounts(String searchKey) {
        return [SELECT Id, Name FROM Account WHERE Name LIKE :('%' + searchKey + '%') LIMIT 10];
    }
}