package linguistics.languages.helg;

import linguistics.stemmers.IStemmer;

class PorterStemmerHELG implements IStemmer {

    public function new() { }

    public function stem( myString:String ):String {

        return myString;

    }

}