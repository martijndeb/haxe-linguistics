package tests;

import linguistics.Linguistics;
import linguistics.tokenizers.ITokenizer;
import linguistics.languages.Dutch;
import linguistics.languages.English;

using Lambda;
class TestCaseBasicTokenizer extends haxe.unit.TestCase {

    public function testTokenizeEnglish():Void {

        Linguistics.getInstance().setLanguage(English);
        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();

        this.assertEquals(
            "fool thinks be wise wise man knows be fool",

            tokenizer.tokenize( "A fool thinks himself to be wise, but a wise man knows himself to be a fool." ).map(
                function(v):String { return v.toString(); }
            ).join(" ")
        );

    }

     public function testTokenizeDutch():Void {

        Linguistics.getInstance().setLanguage(Dutch);
        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();

        this.assertEquals(
            [
                Linguistics.getInstance().getToken( "Nederlanders", 0, 0 ),
                Linguistics.getInstance().getToken( "drinken", 1, 1 ),
                Linguistics.getInstance().getToken( "'s", 2, 2 ),
                Linguistics.getInstance().getToken( "morgens", 3, 3 ),
                Linguistics.getInstance().getToken( "gemiddeld", 4, 4 ),
                Linguistics.getInstance().getToken( "2", 5, 5 ),
                Linguistics.getInstance().getToken( "koppen", 6, 6 ),
                Linguistics.getInstance().getToken( "koffie", 7, 7 )
            ].map(
                function(v):String { return v.toString(); }
            ).join(" "),

            tokenizer.tokenize( "Nederlanders drinken 's morgens gemiddeld 2 koppen koffie." ).map(
                function(v):String { return v.toString(); }
            ).join(" ")
        );

    }

 }