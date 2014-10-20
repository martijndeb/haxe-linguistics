package tests;

import tests.TestCaseBasicTokenizer;
import tests.TestCaseLengthBasedTokenizer;
import tests.TestCaseDictionary;
import tests.TestCaseLevenshteinDistance;

class TestCaseRunner {

    static function main():Void {

        var runner = new haxe.unit.TestRunner();

        runner.add( new TestCaseBasicTokenizer() );
        runner.add( new TestCaseLengthBasedTokenizer() );
        runner.add( new TestCaseDictionary() );
        runner.add( new TestCaseLevenshteinDistance() );

        var success = runner.run();

        #if sys
        Sys.exit(success ? 0 : 1);
        #end

    }
}