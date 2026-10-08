public class LanguageTranslation {
    public static string languageType(string employeeLocale){
        string language='English';
        string employeeLocaleCheck = employeeLocale.toLowerCase();
        switch on employeeLocaleCheck{
            when 'UAE'{
                language = 'Arabic';
            }
            when 'US', 'UK'{
                language = 'English';
            }
            when 'Russia'{
                language = 'Russian';
            }
            when 'China'{
                language = 'Chinese';
            }
            when else{
                language = 'English';
            }
        }
        return language;
    }
}