package linguistics.languages.fry;

import linguistics.stemmers.IStemmer;

class PorterStemmerFRY implements IStemmer {

    public function new() { }

    public function stem( myString:String ):String {

        return myString;

    }

}