package linguistics.languages.en;

import linguistics.stemmers.IStemmer;
import linguistics.stemmers.Region12;
import linguistics.stemmers.ConsonantsMarker;
import linguistics.utils.StringUtility;

/**
 * Stemming algorithm based on the works of Martin Porter and it's Porter2 follow up
 * mostly following the ruleset in the following snowball description.
 * http://snowball.tartarus.org/algorithms/english/stemmer.html
 */
class PorterStemmerEN implements IStemmer {

    private var vowels:Array<String> = [ 'a', 'e', 'i', 'o', 'u', 'y' ];
    private var doubles:Array<String> = [ 'bb', 'dd', 'ff', 'gg', 'mm', 'nn', 'pp', 'rr', 'tt' ];
    private var li_endings:Array<String> = [ 'c', 'd', 'e', 'g', 'h', 'k', 'm', 'n', 'r', 't' ];

    public function new() { }

    public function stem( myString:String ):String {

        var stem:String = StringTools.trim( myString );

        if ( stem.length < 3 ) {

            return stem;

        }

        stem = stem.toLowerCase();

        var consonants:ConsonantsMarker = new ConsonantsMarker( vowels );
        var regions:Region12 = new Region12( vowels );

        stem = consonants.mark( stem );

        var R1:String = regions.getRegion1( stem );
        var R2:String = regions.getRegion2( stem, R1 );

        stem = step0( stem );
        R1 = regions.getRegion1( stem );
        R2 = regions.getRegion2( stem, R1 );

        stem = step1a( stem );
        R1 = regions.getRegion1( stem );
        R2 = regions.getRegion2( stem, R1 );

        stem = step1b( stem, R1 );
        R1 = regions.getRegion1( stem );
        R2 = regions.getRegion2( stem, R1 );

        stem = step1c( stem );
        R1 = regions.getRegion1( stem );
        R2 = regions.getRegion2( stem, R1 );

        stem = step2( stem, R1 );
        R1 = regions.getRegion1( stem );
        R2 = regions.getRegion2( stem, R1 );

        stem = step3( stem, R1, R2 );
        R1 = regions.getRegion1( stem );
        R2 = regions.getRegion2( stem, R1 );

        stem = step4( stem, R2 );
        R1 = regions.getRegion1( stem );
        R2 = regions.getRegion2( stem, R1 );

        stem = step5( stem, R1, R2 );
        R1 = regions.getRegion1( stem );
        R2 = regions.getRegion2( stem, R1 );

        return stem;

    }

    private function step0( myString:String ):String {

        var stem:String = myString;

        if ( StringTools.endsWith( stem, "'s'" ) ) {

            stem = stem.substr( 0, stem.length - 3 );

        }

        if ( StringTools.endsWith( stem, "'s" ) ) {

            stem = stem.substr( 0, stem.length - 2 );

        }

        if ( StringTools.endsWith( stem, "'" ) ) {

            stem = stem.substr( 0, stem.length - 1 );

        }

        return stem;

    }

    private function step1a( myString:String ):String {

        var stem:String = myString;

        if ( StringTools.endsWith( stem, "sses" ) ) {

            stem = stem.substr( 0, -4 ) + "ss";

        } else if ( StringTools.endsWith( stem, "ies" ) || StringTools.endsWith( stem, "ied" ) ) {

            var tempStem = stem.substr( 0, -3 );

            if ( tempStem.length > 1 &&
                 vowels.indexOf( tempStem.substr( tempStem.length, -1 ) ) == -1 &&
                 vowels.indexOf( tempStem.substr( tempStem.length, -2 ) ) == -1 ) {

                stem = tempStem + "i";

            } else if ( tempStem.length > 0 ) {

                stem = tempStem + "ie";

            }

        } else if ( StringTools.endsWith( stem, "ss" ) ) {

            return stem;

        } else if ( StringTools.endsWith( stem, "s" ) &&
                    vowels.indexOf( stem.substr( stem.length - 2, 1) ) < 0 ) {

            stem = stem.substr( 0, -1 );

        } else if ( StringTools.endsWith( stem, "s" ) &&
                    vowels.indexOf( stem.substr( stem.length - 2, 1) ) > -1 &&
                    (
                        vowels.indexOf( stem.substr( stem.length - 3, 1) ) < 0 || /* Either non-vowel or double vowel */
                        stem.substr( stem.length - 3, 1) == stem.substr( stem.length - 2, 1)
                    ) ) {

            stem = stem.substr( 0, -1 );

        }

        return stem;

    }

    private function step1b( myString:String, R1:String ):String {

        var stem:String = myString;

        if ( StringTools.endsWith( R1, "eed" ) ) {

            stem = stem.substr( 0, -1 ); // transform eed into ee

        } else if ( StringTools.endsWith( R1, "eedly" ) ) {

            stem = stem.substr( 0, -3 ); // transform eedly into ee

        } else if ( StringTools.endsWith( stem, "ed" ) ||
                    StringTools.endsWith( stem, "edly" ) ||
                    StringTools.endsWith( stem, "ing" ) ||
                    StringTools.endsWith( stem, "ingly" )
                  ) {

            var rem:Int = -2;
            if ( StringTools.endsWith( stem, "ing" ) ) {

                rem = -3;

            } else if ( StringTools.endsWith( stem, "edly" ) ) {

                rem = -4;

            } else if ( StringTools.endsWith( stem, "ingly" ) ) {

                rem = -5;

            }


            var tempStem:String = stem.substr( 0, rem );

            // Should check word part, but for now check 3 chars back
            if ( vowels.indexOf( stem.substr( stem.length - 1, 1 ) ) > -1 ||
                 vowels.indexOf( stem.substr( stem.length - 2, 1 ) ) > -1 ||
                 vowels.indexOf( stem.substr( stem.length - 3, 1 ) ) > -1 ) {

                stem = tempStem;

                if ( StringTools.endsWith( stem, "at") ||
                     StringTools.endsWith( stem, "bl") ||
                     StringTools.endsWith( stem, "iz") ) {

                    stem = stem + "e";

                }

                if ( doubles.indexOf( stem.substr( stem.length - 2, 2 ) ) > -1 ) {

                    stem = stem.substr( 0, -1 );

                }

            }

        }

        return stem;

    }

    private function step1c( myString:String ):String {

        var stem:String = myString;

        if ( stem.length > 2 &&
            vowels.indexOf( stem.substr( stem.length - 2, 1 ) ) < 0 &&
            stem.toLowerCase().substr( stem.length - 1) == "y" ) {

            stem = stem.substr( 0, -1 ) + "i";

        }

        return stem;

    }

    private function step2( myString:String, R1:String ):String {

        var stem:String = myString;

        if ( StringTools.endsWith( stem, "fulness" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "fulness", "ful" );

        } else if ( StringTools.endsWith( stem, "ousness" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ousness", "ous" );

        } else if ( StringTools.endsWith( stem, "iveness" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "iveness", "ive" );

        } else if ( StringTools.endsWith( stem, "ization" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ization", "ize" );

        } else if ( StringTools.endsWith( stem, "ational" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ational", "ate" );

        } else if ( StringTools.endsWith( stem, "tional" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "tional", "tion" );

        } else if ( StringTools.endsWith( stem, "biliti" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "biliti", "ble" );

        } else if ( StringTools.endsWith( stem, "lessli" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "lessli", "less" );

        } else if ( StringTools.endsWith( stem, "fulli" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "fulli", "ful" );

        } else if ( StringTools.endsWith( stem, "ousli" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ousli", "ous" );

        } else if ( StringTools.endsWith( stem, "iviti" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "iviti", "ive" );

        } else if ( StringTools.endsWith( stem, "entli" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "entli", "ent" );

        } else if ( StringTools.endsWith( stem, "ation" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ation", "ate" );

        } else if ( StringTools.endsWith( stem, "alism" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "alism", "al" );

        } else if ( StringTools.endsWith( stem, "aliti" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "aliti", "al" );

        } else if ( StringTools.endsWith( stem, "enci" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "enci", "ence" );

        } else if ( StringTools.endsWith( stem, "anci" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "anci", "ance" );

        } else if ( StringTools.endsWith( stem, "abli" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "abli", "able" );

        } else if ( StringTools.endsWith( stem, "izer" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "izer", "ize" );

        } else if ( StringTools.endsWith( stem, "ator" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ator", "ate" );

        } else if ( StringTools.endsWith( stem, "alli" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "alli", "al" );

        } else if ( StringTools.endsWith( stem, "bli" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "bli", "ble" );

        } else if ( StringTools.endsWith( R1, "ogi" ) &&
                    stem.substr( stem.length - 3, 1 ) == "l" ) {

            stem = stem.substr( 0, -3 ) + "og";

        } else if ( StringTools.endsWith( R1, "li" ) &&
                    li_endings.indexOf( stem.substr( stem.length - 3, 1 ) ) > -1 ) {

            stem = stem.substr( 0, -2 );

        }

        return stem;

    }

    private function step3( myString:String, R1:String, R2:String ):String {

        var stem:String = myString;

        if ( R1.indexOf( "ational" ) > -1 ) {

            stem = StringUtility.replaceLastOccurance( stem, "ational", "ate" );

        } else if ( R1.indexOf( "tional" ) > -1 ) {

            stem = StringUtility.replaceLastOccurance( stem, "tional", "tion" );

        } else if ( R1.indexOf( "alize" ) > -1 ) {

            stem = StringUtility.replaceLastOccurance( stem, "alize", "al" );

        } else if ( R1.indexOf( "icate" ) > -1 ) {

            stem = StringUtility.replaceLastOccurance( stem, "icate", "ic" );

        } else if ( R1.indexOf( "iciti" ) > -1 ) {

            stem = StringUtility.replaceLastOccurance( stem, "iciti", "ic" );

        } else if ( R1.indexOf( "ical" ) > -1 ) {

            stem = StringUtility.replaceLastOccurance( stem, "ical", "ic" );

        } else if ( R1.indexOf( "full" ) > -1 ) {

            stem = StringUtility.replaceLastOccurance( stem, "full", "" );

        } else if ( R1.indexOf( "ness" ) > -1 ) {

            stem = StringUtility.replaceLastOccurance( stem, "ness", "" );

        } else if ( R1.indexOf( "ative" ) > -1 && R2.indexOf( "ative" ) > -1 ) {

            stem = StringUtility.replaceLastOccurance( stem, "ative", "" );

        }

        return stem;

    }

    private function step4( myString:String, R2:String ):String {

        var stem:String = myString;

        if ( StringTools.endsWith( R2, "ement" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ement", "" );

        } else if ( StringTools.endsWith( R2, "ance" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ance", "" );

        } else if ( StringTools.endsWith( R2, "ence" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ence", "" );

        } else if ( StringTools.endsWith( R2, "able" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "able", "" );

        } else if ( StringTools.endsWith( R2, "ible" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ible", "" );

        } else if ( StringTools.endsWith( R2, "ment" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ment", "" );

        } else if ( StringTools.endsWith( R2, "ant" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ant", "" );

        } else if ( StringTools.endsWith( R2, "ent" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ent", "" );

        } else if ( StringTools.endsWith( R2, "ism" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ism", "" );

        } else if ( StringTools.endsWith( R2, "ate" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ate", "" );

        } else if ( StringTools.endsWith( R2, "iti" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "iti", "" );

        } else if ( StringTools.endsWith( R2, "ous" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ous", "" );

        } else if ( StringTools.endsWith( R2, "ive" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ive", "" );

        } else if ( StringTools.endsWith( R2, "ize" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ize", "" );

        } else if ( StringTools.endsWith( R2, "al" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "al", "" );

        } else if ( StringTools.endsWith( R2, "er" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "er", "" );

        } else if ( StringTools.endsWith( R2, "ic" ) ) {

            stem = StringUtility.replaceLastOccurance( stem, "ic", "" );

        }

        return stem;

    }

    private function step5( myString:String, R1:String, R2:String ):String {

        var stem:String = myString;

        var lIndex:Int = R2.lastIndexOf( "l" );
        if ( lIndex > -1 && StringTools.endsWith( stem.substr( 0, -( R2.length ) ), "l" ) == true ) {

            stem = StringUtility.replaceLastOccurance( stem, "l", "" );

        }

        var tempString:String = "";
        var eIndex:Int = R2.lastIndexOf( "e" );
        if ( eIndex > -1 ) {

            tempString = stem.substr( 0, -( R2.length - eIndex ) );

        }
        // elseif below breaks "knackeries"
        /*else if ( R1.lastIndexOf( "e" ) > -1 ) {

            eIndex = R1.lastIndexOf( "e" );
            tempString = stem.substr( 0, -( R1.length - eIndex ) );
        }*/

        if ( tempString != "" && isShortSyllable( tempString.substr( tempString.length - 3 ) ) == false ) {

            stem = StringUtility.replaceLastOccurance( stem, "e", "" );

        }


        return stem;

    }

    private function isShortSyllable( myString:String ):Bool {

        if ( myString.length == 3 ) {

            var chr1:String = myString.substr( 0, 1 );
            var chr2:String = myString.substr( 1, 1 );
            var chr3:String = myString.substr( 2, 1 );

            if ( vowels.indexOf( chr3 ) < 0 && chr3 != "w" && chr3 != "x" && chr3 != "y" &&
                 vowels.indexOf( chr2 ) > -1 &&
                 vowels.indexOf( chr1 ) < 0 ) {

                return true;

            }

        }

        return false;

    }

}