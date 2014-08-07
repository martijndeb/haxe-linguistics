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
            [
                Linguistics.getInstance().getToken( "A", 0, 0 ),
                Linguistics.getInstance().getToken( "fool", 1, 1 ),
                Linguistics.getInstance().getToken( "thinks", 2, 2 ),
                Linguistics.getInstance().getToken( "himself", 3, 3 ),
                Linguistics.getInstance().getToken( "to", 4, 4 ),
                Linguistics.getInstance().getToken( "be", 5, 5 ),
                Linguistics.getInstance().getToken( "wise", 6, 6 ),
                Linguistics.getInstance().getToken( "but", 7, 7 ),
                Linguistics.getInstance().getToken( "a", 8, 8 ),
                Linguistics.getInstance().getToken( "wise", 9, 9 ),
                Linguistics.getInstance().getToken( "man", 10, 10 ),
                Linguistics.getInstance().getToken( "knows", 11, 11 ),
                Linguistics.getInstance().getToken( "himself", 12, 12 ),
                Linguistics.getInstance().getToken( "to", 13, 13 ),
                Linguistics.getInstance().getToken( "be", 14, 14 ),
                Linguistics.getInstance().getToken( "a", 15, 15 ),
                Linguistics.getInstance().getToken( "fool", 16, 16 )
            ].map(
                function(v):String { return v.toString(); }
            ).join(" "),

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