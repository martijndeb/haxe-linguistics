package linguistics.stemmers;

/**
 * Implementation of generic R1 and R2 detection.
 * Should be generic for multiple languages as long as vowels is filled correctly.
 * See: http://snowball.tartarus.org/texts/r1r2.html
 */
class Region12 {

    private var vowels:Array<String> = [];

    public function new( myVowels:Array<String> ) {

        vowels = myVowels;

    }

    public function getRegion1( myString:String ):String {

        if ( myString.length < 4) {

            return "";

        }

        myString = myString.toLowerCase();

        var pos:Int = 1;
        while ( pos < myString.length ) {

            if ( vowels.indexOf( myString.substr( pos - 1, 1) ) > -1 &&
                 vowels.indexOf( myString.substr( pos, 1) ) == -1 ) {

                return myString.substr( pos + 1 );

            }

            pos++;

        }

        return "";

    }

    public function getRegion2( myString:String, R1:String ):String {

        if ( R1.length < 2 ) {

            return "";

        }

        myString = myString.toLowerCase();

        var pos:Int = myString.indexOf( R1 );
        while ( pos < myString.length ) {

            if ( vowels.indexOf( myString.substr( pos - 1, 1) ) > -1 &&
                 vowels.indexOf( myString.substr( pos, 1) ) == -1 ) {

                return myString.substr( pos + 1 );

            }

            pos++;

        }

        return "";

    }

}