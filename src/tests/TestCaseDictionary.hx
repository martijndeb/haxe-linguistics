package tests;

import linguistics.Linguistics;
import linguistics.languages.English;
import linguistics.dictionaries.Dictionary;

using Lambda;
class TestCaseDictionary extends haxe.unit.TestCase {

    public function testDictionary():Void {

        Linguistics.getInstance().setLanguage(English);

        var dict:Dictionary = new Dictionary();
        dict.addDocument( "A fool thinks himself to be wise, but a wise man knows himself to be a fool." );

        this.assertEquals(17, dict.getTotalWordCount());
        this.assertEquals(11, dict.getWordCount());

    }

 }