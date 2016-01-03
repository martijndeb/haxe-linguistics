package tests;

import linguistics.Linguistics;
import linguistics.tokenizers.ITokenizer;
import linguistics.tokenizers.tokens.IToken;
import linguistics.languages.*;

using Lambda;
class TestCaseLengthBasedTokenizer extends haxe.unit.TestCase {

    public function testTokenizeEnglish():Void {

        Linguistics.getInstance().setLanguage( English );
        var tokenizer:ITokenizer = Linguistics.getInstance().getLengthBasedTokenizer();

        this.assertEquals(
            "T h e   t r a i n   h a s   a r r i v e d   o n   t h e   2 n d   s t a t i o n",
            tokenizer.tokenize( "The train has arrived on the 2nd station." ).map(
                function(v):String { return v.toString(); }
            ).join(" ")
        );

    }

     public function testTokenizeDutch():Void {

        Linguistics.getInstance().setLanguage( Dutch );
        var tokenizer:ITokenizer = Linguistics.getInstance().getLengthBasedTokenizer();

        this.assertEquals(
            "D e   t r e i n   i s   g e a r r i v e e r d   o p   h e t   2 e   s t a t i o n",
            tokenizer.tokenize( "De trein is gearriveerd op het 2e station." ).map(
                function(v):String { return v.toString(); }
            ).join(" ")
        );

    }

     public function testTokenizeGerman():Void {

        Linguistics.getInstance().setLanguage( German );
        var tokenizer:ITokenizer = Linguistics.getInstance().getLengthBasedTokenizer();

        this.assertEquals(
            "W i e   g e h t s t   d i r   J o h a n n",
            tokenizer.tokenize( "Wie gehtst dir, Johann?" ).map(
                function(v):String { return v.toString(); }
            ).join(" ")
        );

    }

     public function testTokenizeFrisian():Void {

        Linguistics.getInstance().setLanguage( Frisian );
        var tokenizer:ITokenizer = Linguistics.getInstance().getLengthBasedTokenizer();

        this.assertEquals(
            "B u t e r   b r e a   e n   g r i e n e   t s i i s",
            tokenizer.tokenize( "Buter, brea, en griene tsiis" ).map(
                function(v):String { return v.toString(); }
            ).join(" ")
        );

    }

 }