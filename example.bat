:: Appium server URL
set appiumServerURL=%IP%:4723/wd/hub
echo %appiumServerURL%


:: Start Appium session
start cmd /k call appium --relaxed-security --session-override

:: wait 30s
timeout /t 30 /nobreak

:: Clean & Build Maven 
call mvn clean install


:: run
java -jar path\to\jar --plugin pretty --plugin html:target/cucumber-reports --plugin json:cucumber.json --glue path/to/definition --monochrome --tags %FeaturesTag% --tags ~@ignore path\to\features

goto end


:end
pause
