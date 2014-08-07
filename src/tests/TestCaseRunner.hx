package tests;

import tests.TestCaseBasicTokenizer;

class TestCaseRunner {

    static function main():Void {

        var runner = new haxe.unit.TestRunner();
        runner.add(new TestCaseBasicTokenizer());

        var success = runner.run();

        #if sys
        Sys.exit(success ? 0 : 1);
        #end
    }
}