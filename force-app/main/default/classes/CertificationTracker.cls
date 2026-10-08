public class CertificationTracker {
   /* public static void certificationStored(Map<String, Date> certificateObtained){
        set<String> certificate = certificateObtained.keyset();
        list<Date> issueDate = certificateObtained.values();    
    }*/
    
    public static Map<String, Date> myCertificationData = new Map<String, Date>();
    
    public static void addNewCertifications(String certificate, Date issueDate){
        mycertificationData.put(certificate, issueDate);
    }
    
    public static integer certificationCount(){
        integer count = mycertificationData.size();
        return count;
    } 
    
    public static List<Date> certificationDateCount(){
        List<Date> count = mycertificationData.values();
        return count;
    }
    
}