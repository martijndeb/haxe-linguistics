package linguistics.stemmers;

/**
 * Implementation of generic R1 and R2 detection.
 * Should be generic for multiple languages as long as vowels is filled correctly.
 * See: http://snowball.tartarus.org/texts/r1r2.html
 */
class Region12 {

    // if word starts with a value from this array, set the remainder to R1
    public var startsWithR1RemainderModifier:Array<String> = new Array<String>();

    private var vowels:Array<String> = [];

    public function new( myVowels:Array<String> ) {

        vowels = myVowels;

    }

    public function getRegion1( myString:String ):String {

        if ( myString.length < 4) {

            return "";

        }

        myString = myString.toLowerCase();

        var it:Iterator<String> = startsWithR1RemainderModifier.iterator();
        for ( r1mod in it ) {

            if ( myString.substr( 0, r1mod.length ) == r1mod ) {

                return r1mod;

            }

        }

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