package tests;

import linguistics.Linguistics;
import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;
import linguistics.tokenizers.filters.StopwordTokenFilter;
import linguistics.languages.Dutch;
import linguistics.languages.English;
import linguistics.languages.German;
import linguistics.tokenizers.BoundaryTokenizer;

using Lambda;
class TestCaseBoundaryTokenizer extends haxe.unit.TestCase {

    public function testTokenizeEnglish():Void {

        Linguistics.getInstance().setLanguage( English );
        var tokenizer:ITokenizer = Linguistics.getInstance().getBoundaryTokenizer();

        this.assertEquals(
            3,
            tokenizer.tokenize( "A man walked down the street. A car crashed into the wall! The man witnissed a massacre." ).length
        );

        this.assertEquals(
            2,
            tokenizer.tokenize( "A man walked down the street, a car crashed into the wall! The man witnissed a massacre" ).length
        );

    }

     public function testTokenizeDutch():Void {

        Linguistics.getInstance().setLanguage( Dutch );
        var tokenizer:ITokenizer = Linguistics.getInstance().getBoundaryTokenizer();

        this.assertEquals(
            3,
            tokenizer.tokenize( "Een man liep over straat. Een auto reed tegen een muur! De man zag een bloedbad." ).length
        );

        this.assertEquals(
            2,
            tokenizer.tokenize( "Een man liep over straat, een auto reed tegen een muur! De man zag een bloedbad" ).length
        );

    }

     public function testTokenizeGerman():Void {

        Linguistics.getInstance().setLanguage( German );
        var tokenizer:ITokenizer = Linguistics.getInstance().getBoundaryTokenizer();

        this.assertEquals(
            3,
            tokenizer.tokenize( "Ein Mann ging die Strasse hinunter. Ein Auto stürzte in eine Wand! Der Mann sah ein Blutbad." ).length
        );

        this.assertEquals(
            2,
            tokenizer.tokenize( "Ein Mann ging die Strasse hinunter, ein Auto stürzte in eine Wand! Der Mann sah ein Blutbad" ).length
        );

    }

 }