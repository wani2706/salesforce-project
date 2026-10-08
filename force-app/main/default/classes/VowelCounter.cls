public class VowelCounter {
    public static List<integer> countVowel(list<string> sentences){
        
        list<integer> totalVowelCount = new list<integer>();
        list<string> listOfVowel = new List<string>{'a','e','i','o','u'};
        for(string eachSentence: sentences){
            if(listOfVowel.size()== 5){
            integer vowelCount = eachSentence.toLowerCase().countMatches(listOfVowel[0])
            + eachSentence.toLowerCase().countMatches(listOfVowel[1])
            + eachSentence.toLowerCase().countMatches(listOfVowel[2])
            + eachSentence.toLowerCase().countMatches(listOfVowel[3])
            + eachSentence.toLowerCase().countMatches(listOfVowel[4]);
            totalVowelCount.add(vowelCount); 
            }
        }
        return totalVowelCount;
    }
}