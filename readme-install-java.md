# Install java ecommerce

## Requirements

* VPS - access
    * public ip 
    ``18.196.219.187``
    * user name 
    ``ec2-user``
    * private key
    ``curl -O http://adsk.dydaktyka.jkan.pl/_static/id_student``
    * ``chmod 600 id_student``
    * ``ssh username@ip -i id_student``
*  ecommerce -repo
    * github ``https://github.com/SokolowskiMik/e-commerce-app.git``
    * albo ``https://github.com/jkanclerz/computer-programming-4-2024.git``

# ssh ec2-user@18.196.219.187 -i id_student "sudo bash -s" < 01-ecommerce-bash/install.sh

## ToDoes
* -y automatycznie odpowiada tak przy sudo install -y
* Upgrade system dependency
    * ``sudo dnf update && sudo dnf upgrade``
    * ``sudo dnf upgrage``
* Search for packages
    * ``dnf search {query}``
    * ``dnf search git``
* install packages
    * ``sudo dnf install git``

* Sync repo
    * ``git clone https://github.com/SokolowskiMik/e-commerce-app.git``
* install java env
    * ``dnf search java``
    * install java JRE 
    * dnf install -y -q   java-17-amazon-corretto \
    maven-local-amazon-corretto17
    * ``sudo dnf install java-17-amazon-corretto -y``
    * install maven (jeżeli pakietu nie ma w repo to szukamy na stronie producenta) wartosc dydaktyczna
        * download mvn binary 
            * ``wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz ``
        * unpack/unarchive tar.gz
            * ``tar xvzf apache-maven-3.9.9-bin.tar.gz``
        * link to PATH aware dir [ln (link) skrot do mvn aby byl w $PATH (dodajemy mvn do patha)]:
            * ``sudo ln -s /home/ec2-user/apache-maven-3.9.9/bin/mvn /usr/bin/mvn``
    * Compile & test & start 
        * `` mvn compile ``
        * `` mvn test ``
        * `` mvn package ``
        * remember to do it in project directory ``cd computer-programming-4-2024/``
        * mvn package -DskipTests pomija testy ktore nie przechodzą (nie robi sie tak)
    * Start it
        * ``java -jar target/CreditCard-1.0-SNAPSHOT.jar``
        * zmieniamy port ``java -Dserver.port=8080 -jar target/CreditCard-1.0-SNAPSHOT.jar``






## Final output

* open ``http://{public ip}:80``
* assert myEcommerceIsAvailable()

