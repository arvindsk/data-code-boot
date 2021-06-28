# data-code-boot

- Pre-requiste is to install JRE1.8, maven 3x and MySQL 5.6.x. My SQL DB installed and app tables created

1. To launch the app, follow steps:
   1. Clone the sources using the either of urls in the git project as given below
      - https://github.com/arvindsk/data-code-boot.git
      - git@github.com:arvindsk/data-code-boot.git
   PS: if you are not able to clone, download the zip of the source code and unzip it
   2. Go to the root directory of the project in your local, 
   3. \src\main\resources\application.properties, set spring.profiles.active=prod
   4. open cmd promt in administrator mode from root directory of the project
   3. rum command - mvn clean install
   4. run the sql script in \src\main\resources\adapt-green-script.sql folder in mysql DB through any DB viewer
   5. Go to the target folder after the above command is completed successfully
   6. java -jar *.jar

