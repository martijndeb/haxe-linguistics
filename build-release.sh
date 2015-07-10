#!/bin/bash
#
# For we will never forget issue 2
# https://github.com/sexybiggetje/haxe-linguistics/issues/2

mkdir haxe-linguistics

cp *.md haxe-linguistics/
cp *.hxml haxe-linguistics/

cp haxelib.json haxe-linguistics/

cp -rf applications haxe-linguistics/
cp -rf examples haxe-linguistics/
cp -rf src haxe-linguistics/

zip -r haxe-linguistics.zip haxe-linguistics/
rm -rf haxe-linguistics/