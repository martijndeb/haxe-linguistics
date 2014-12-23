package linguistics.languages.nl;

import linguistics.stemmers.IStemmer;

class PorterStemmerNL implements IStemmer {

    public function new() { }

    public function stem( myString:String ):String {

        return myString;

    }

}