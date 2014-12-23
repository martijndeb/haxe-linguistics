package linguistics.languages.de;

import linguistics.stemmers.IStemmer;

class PorterStemmerDE implements IStemmer {

    public function new() { }

    public function stem( myString:String ):String {

        return myString;

    }

}