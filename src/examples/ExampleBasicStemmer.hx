package examples;

import linguistics.Linguistics;
import linguistics.languages.English;
import linguistics.stemmers.IStemmer;

class ExampleBasicStemmer
{
    static public function main():Void {

        Linguistics.getInstance().setLanguage( English );
        var stemmer:IStemmer = Linguistics.getInstance().getBasicStemmer();

        trace( stemmer.stem( "sky" ), stemmer.stem( "skies" ), stemmer.stem( "consolidated" ) );

    }
}