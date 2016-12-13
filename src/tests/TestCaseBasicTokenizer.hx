package tests;

import linguistics.Linguistics;
import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;
import linguistics.tokenizers.filters.StopwordTokenFilter;
import linguistics.languages.*;

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

     public function testTokenizeFrisian():Void {

        Linguistics.getInstance().setLanguage( Frisian );
        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();

        this.assertEquals(
            "Bûter brea en griene tsiis wa dat net sizze kin is gjin oprjochte Fries",
            tokenizer.tokenize( "Bûter, brea, en griene tsiis; wa dat net sizze kin, is gjin oprjochte Fries" ).map(
                function(v):String { return v.toString(); }
            ).join(" ")
        );

    }

     public function testTokenizeHeligolandic():Void {

        Linguistics.getInstance().setLanguage( Heligolandic );
        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();

        this.assertEquals(
            "Alle Mensken sen frai likwörti en med de sallowski Rechten geboorn Djo hoa Ferstant en Geweeten medfin'n en skul arker as Bruurs uundjintreed",
            tokenizer.tokenize( "Alle Mensken sen frai, likwörti en med de sallowski Rechten geboorn. Djo hoa Ferstant en Geweeten medfin'n en skul arker as Bruurs uundjintreed" ).map(
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

     public function testTokenizeFilteredFrisian():Void {

        Linguistics.getInstance().setLanguage( Frisian );
        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();
        var tokenSet:Array<IToken> = tokenizer.tokenize( "Bûter, brea, en griene tsiis; wa dat dat net sizze kin, is gjin oprjochte Fries" );
        tokenSet = tokenizer.applyFilter( tokenSet, StopwordTokenFilter );

        this.assertEquals(
            "Bûter brea griene tsiis wa sizze oprjochte Fries",

            tokenSet.map(
                function(v):String { return v.toString(); }
            ).join(" ")
        );

    }

     public function testTokenizeFilteredHeligolandic():Void {

        Linguistics.getInstance().setLanguage( Heligolandic );
        var tokenizer:ITokenizer = Linguistics.getInstance().getBasicTokenizer();
        var tokenSet:Array<IToken> = tokenizer.tokenize( "Alle Mensken sen frai, likwörti en med de sallowski Rechten geboorn. Djo hoa Ferstant en Geweeten medfin'n en skul arker as Bruurs uundjintreed" );
        tokenSet = tokenizer.applyFilter( tokenSet, StopwordTokenFilter );

        this.assertEquals(
            "Alle Mensken sen frai likwörti en med de sallowski Rechten geboorn Djo hoa Ferstant en Geweeten medfin'n en skul arker as Bruurs uundjintreed",

            tokenSet.map(
                function(v):String { return v.toString(); }
            ).join(" ")
        );

    }

 }