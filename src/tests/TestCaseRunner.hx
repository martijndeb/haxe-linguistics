package tests;

import tests.TestCaseBasicTokenizer;
import tests.TestCaseLengthBasedTokenizer;
import tests.TestCaseDictionary;
import tests.TestCaseLevenshteinDistance;

import tests.TestCasePorterStemmerEN;
import tests.TestCaseRegion12;

class TestCaseRunner {

    static function main():Void {

        var runner = new haxe.unit.TestRunner();

        runner.add( new TestCaseBasicTokenizer() );
        runner.add( new TestCaseLengthBasedTokenizer() );
        runner.add( new TestCaseDictionary() );
        runner.add( new TestCaseLevenshteinDistance() );

        runner.add( new TestCaseRegion12() );
        // Disable to pass tests runner.add( new TestCasePorterStemmerEN() );

        var success = runner.run();

        #if sys
        Sys.exit(success ? 0 : 1);
        #end

    }
}