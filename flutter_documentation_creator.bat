echo Start to create documentation for the project LeoML Parser
rmdir /s /q "doc"
mkdir "doc"
mkdir "coverage"
echo Start to run the unit tests and to collect the code coverage
call flutter test --machine > doc\machine.log --coverage
echo Creating the coverage protocol as HTML
call perl %GENHTML% -o doc\coverage\html coverage\lcov.info
echo Creating the unit test report
mkdir doc\test_report
call flutter test --machine | tojunit > doc\test_report\junit_test_report.xml
call junit-viewer --results=doc\test_report\junit_test_report.xml  --save=doc\test_report\junit_test_report.html --minify=false
del doc\machine.log
echo Starting code metrics
call dcm calculate-metrics lib --reporter=html --output-directory=doc/code_metrics-report
echo Starting code duplication detection
call jscpd -o doc\jscpd --reporters html lib\
echo Create documentation
REM call dart doc -o doc\api .
rmdir /s /q "coverage"