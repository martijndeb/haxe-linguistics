package tests;

import linguistics.Linguistics;
import linguistics.languages.English;
import linguistics.languages.en.PorterStemmerEN;
import linguistics.stemmers.IStemmer;

class TestCasePorterStemmerEN extends haxe.unit.TestCase {

    public function testPorterStemmerEN():Void {

        Linguistics.getInstance().setLanguage( English );
        var stemmer:IStemmer = Linguistics.getInstance().getBasicStemmer();

        // List from: http://snowball.tartarus.org/algorithms/english/stemmer.html
        this.assertEquals( "consign", stemmer.stem( "consign" ) );
        this.assertEquals( "consign", stemmer.stem( "consigned" ) );
        this.assertEquals( "consign", stemmer.stem( "consigning" ) );
        this.assertEquals( "consign", stemmer.stem( "consignment" ) );
        this.assertEquals( "consist", stemmer.stem( "consist" ) );
        this.assertEquals( "consist", stemmer.stem( "consisted" ) );
        this.assertEquals( "consist", stemmer.stem( "consistency" ) );
        this.assertEquals( "consist", stemmer.stem( "consistent" ) );
        this.assertEquals( "consist", stemmer.stem( "consistently" ) );
        this.assertEquals( "consist", stemmer.stem( "consisting" ) );
        this.assertEquals( "consist", stemmer.stem( "consists" ) );
        this.assertEquals( "consol", stemmer.stem( "consolation" ) );
        this.assertEquals( "consol", stemmer.stem( "consolations" ) );
        this.assertEquals( "consolatori", stemmer.stem( "consolatory" ) );
        this.assertEquals( "console", stemmer.stem( "console" ) );
        this.assertEquals( "consol", stemmer.stem( "consoled" ) );
        this.assertEquals( "console", stemmer.stem( "consoles" ) );
        this.assertEquals( "consolid", stemmer.stem( "consolidate" ) );
        this.assertEquals( "consolid", stemmer.stem( "consolidated" ) );
        this.assertEquals( "consolid", stemmer.stem( "consolidating" ) );
        this.assertEquals( "consol", stemmer.stem( "consoling" ) );
        this.assertEquals( "consol", stemmer.stem( "consolingly" ) );
        this.assertEquals( "consol", stemmer.stem( "consols" ) );
        this.assertEquals( "conson", stemmer.stem( "consonant" ) );
        this.assertEquals( "consort", stemmer.stem( "consort" ) );
        this.assertEquals( "consort", stemmer.stem( "consorted" ) );
        this.assertEquals( "consort", stemmer.stem( "consorting" ) );
        this.assertEquals( "conspicu", stemmer.stem( "conspicuous" ) );
        this.assertEquals( "conspicu", stemmer.stem( "conspicuously" ) );
        this.assertEquals( "conspiraci", stemmer.stem( "conspiracy" ) );
        this.assertEquals( "conspir", stemmer.stem( "conspirator" ) );
        this.assertEquals( "conspir", stemmer.stem( "conspirators" ) );
        this.assertEquals( "conspire", stemmer.stem( "conspire" ) );
        this.assertEquals( "conspir", stemmer.stem( "conspired" ) );
        this.assertEquals( "conspir", stemmer.stem( "conspiring" ) );
        this.assertEquals( "constabl", stemmer.stem( "constable" ) );
        this.assertEquals( "constanc", stemmer.stem( "constance" ) );
        this.assertEquals( "constanc", stemmer.stem( "constancy" ) );
        this.assertEquals( "constant", stemmer.stem( "constant" ) );
        this.assertEquals( "knack", stemmer.stem( "knack" ) );
        this.assertEquals( "knackeri", stemmer.stem( "knackeries" ) );
        this.assertEquals( "knack", stemmer.stem( "knacks" ) );
        this.assertEquals( "knag", stemmer.stem( "knag" ) );
        this.assertEquals( "knave", stemmer.stem( "knave" ) );
        this.assertEquals( "knave", stemmer.stem( "knaves" ) );
        this.assertEquals( "knavish", stemmer.stem( "knavish" ) );
        this.assertEquals( "knead", stemmer.stem( "kneaded" ) );
        this.assertEquals( "knead", stemmer.stem( "kneading" ) );
        this.assertEquals( "knee", stemmer.stem( "knee" ) );
        this.assertEquals( "kneel", stemmer.stem( "kneel" ) );
        this.assertEquals( "kneel", stemmer.stem( "kneeled" ) );
        this.assertEquals( "kneel", stemmer.stem( "kneeling" ) );
        this.assertEquals( "kneel", stemmer.stem( "kneels" ) );
        this.assertEquals( "knee", stemmer.stem( "knees" ) );
        this.assertEquals( "knell", stemmer.stem( "knell" ) );
        this.assertEquals( "knelt", stemmer.stem( "knelt" ) );
        this.assertEquals( "knew", stemmer.stem( "knew" ) );
        this.assertEquals( "knick", stemmer.stem( "knick" ) );
        this.assertEquals( "knif", stemmer.stem( "knif" ) );
        this.assertEquals( "knife", stemmer.stem( "knife" ) );
        this.assertEquals( "knight", stemmer.stem( "knight" ) );
        this.assertEquals( "knight", stemmer.stem( "knightly" ) );
        this.assertEquals( "knight", stemmer.stem( "knights" ) );
        this.assertEquals( "knit", stemmer.stem( "knit" ) );
        this.assertEquals( "knit", stemmer.stem( "knits" ) );
        this.assertEquals( "knit", stemmer.stem( "knitted" ) );
        this.assertEquals( "knit", stemmer.stem( "knitting" ) );
        this.assertEquals( "knive", stemmer.stem( "knives" ) );
        this.assertEquals( "knob", stemmer.stem( "knob" ) );
        this.assertEquals( "knob", stemmer.stem( "knobs" ) );
        this.assertEquals( "knock", stemmer.stem( "knock" ) );
        this.assertEquals( "knock", stemmer.stem( "knocked" ) );
        this.assertEquals( "knocker", stemmer.stem( "knocker" ) );
        this.assertEquals( "knocker", stemmer.stem( "knockers" ) );
        this.assertEquals( "knock", stemmer.stem( "knocking" ) );
        this.assertEquals( "knock", stemmer.stem( "knocks" ) );
        this.assertEquals( "knopp", stemmer.stem( "knopp" ) );
        this.assertEquals( "knot", stemmer.stem( "knot" ) );
        this.assertEquals( "knot", stemmer.stem( "knots" ) );
    }


 }