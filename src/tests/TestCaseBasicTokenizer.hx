package tests;

import linguistics.Linguistics;
import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;
import linguistics.tokenizers.filters.StopwordTokenFilter;
import linguistics.languages.Dutch;
import linguistics.languages.English;
import linguistics.languages.German;

using Lambda;
class TestCaseBasicTokenizer extends haxe.unit.TestCase {

    public function testTokenizeEnglish():Void {

        Linguistics.getInstance().setLanguage( English );
        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();

        this.assertEquals(
            "A fool thinks himself to be wise but a wise man knows himself to be a fool",

            tokenizer.tokenize( "A fool thinks himself to be wise, but a wise man knows himself to be a fool." ).map(
                function(v):String { return v.toString(); }
            ).join(" ")
        );

    }

     public function testTokenizeDutch():Void {

        Linguistics.getInstance().setLanguage( Dutch );
        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();

        this.assertEquals(
            "Nederlanders drinken 's morgens gemiddeld 2 koppen koffie",
            tokenizer.tokenize( "Nederlanders drinken 's morgens gemiddeld 2 koppen koffie." ).map(
                function(v):String { return v.toString(); }
            ).join(" ")
        );

    }

     public function testTokenizeGerman():Void {

        Linguistics.getInstance().setLanguage( German );
        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();

        this.assertEquals(
            "Das Eisen schmieden solange es heiß ist",
            tokenizer.tokenize( "Das Eisen schmieden, solange es heiß ist" ).map(
                function(v):String { return v.toString(); }
            ).join(" ")
        );

    }

    public function testTokenizeFilteredEnglish():Void {

        Linguistics.getInstance().setLanguage( English );
        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();
        var tokenSet:Array<IToken> = tokenizer.tokenize( "A fool thinks himself to be wise, but a wise man knows himself to be a fool." );
        tokenSet = tokenizer.applyFilter( tokenSet, StopwordTokenFilter );

        this.assertEquals(
            "fool thinks be wise wise man knows be fool",

            tokenSet.map(
                function(v):String { return v.toString(); }
            ).join(" ")
        );

    }

     public function testTokenizeFilteredDutch():Void {

        Linguistics.getInstance().setLanguage( Dutch );
        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();
        var tokenSet:Array<IToken> = tokenizer.tokenize( "Ik wil 's morgens gemiddeld 2 koppen koffie drinken." );
        tokenSet = tokenizer.applyFilter( tokenSet, StopwordTokenFilter );

        this.assertEquals(
            "'s morgens gemiddeld 2 koppen koffie drinken",

            tokenSet.map(
                function(v):String { return v.toString(); }
            ).join(" ")
        );

    }

     public function testTokenizeFilteredGerman():Void {

        Linguistics.getInstance().setLanguage( German );
        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();
        var tokenSet:Array<IToken> = tokenizer.tokenize( "Das Eisen schmieden, solange es heiß ist" );
        tokenSet = tokenizer.applyFilter( tokenSet, StopwordTokenFilter );

        this.assertEquals(
            "Eisen schmieden solange heiß",

            tokenSet.map(
                function(v):String { return v.toString(); }
            ).join(" ")
        );

    }

 }