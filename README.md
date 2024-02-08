## Azure maven java web app

### The repository containes

#### [`azurewebapp.tf`](https://github.com/Abhimanyu9988/azure-maven-java-web-app/blob/main/azurewebapp.tf)
The Terraform file creates an Azure Linux Web App with a specified Java stack. It creates a resource group, service plan, and web app. The resource group and service plan are used to configure the web app. 

#### [`deploytf.sh`](https://github.com/Abhimanyu9988/azure-maven-java-web-app/blob/main/deploytf.sh)
The file will be responsible to deploy Infrastructure on Azure

#### [`deployapp.sh`](https://github.com/Abhimanyu9988/azure-maven-java-web-app/blob/main/deployapp.sh)
The file will be responsible to deploy maven application

### Description ✋:
We generated a Maven project based on a specific archetype. 
Maven will generate a new directory structure and populate it with the necessary files and configurations for a basic web application project. This includes a src directory for your source code and a webapp directory for web resources like HTML, CSS, and JavaScript. It will also create a pom.xml file that defines the project's dependencies and build settings.

### Deployment ✋:
- `git clone https://github.com/Abhimanyu9988/azure-maven-java-web-app.git`
- `./deploytf.sh`
- `./deployapp.sh`


### Creating the application ✋:
- Generated this application by running command:
`mvn archetype:generate "-DgroupId=example.demo" "-DartifactId=helloworld" "-DarchetypeArtifactId=maven-archetype-webapp" "-DarchetypeVersion=1.4" "-Dversion=1.0-SNAPSHOT"`

> -DgroupId=example.demo: This sets the Maven Group ID for your project. The Group ID is typically used to identify the organization or group responsible for the project. In this case, it's set to example.demo.

> -DartifactId=helloworld: This sets the Maven Artifact ID for your project. The Artifact ID is a unique identifier for your project within the Group ID. In this case, it's set to helloworld.

> -DarchetypeArtifactId=maven-archetype-webapp: This specifies the Maven archetype to use for generating the project. The maven-archetype-webapp archetype is a predefined archetype for creating simple web applications.

> -DarchetypeVersion=1.4: This specifies the version of the archetype to use. In this case, you're using version 1.4 of the maven-archetype-webapp archetype.

> -Dversion=1.0-SNAPSHOT: This sets the initial version number of your project to 1.0-SNAPSHOT.

Maven will generate a helloworld directory structure and populated it with the necessary files and configurations for a basic web application project. Let's get inside the directory next.

- The directory will contain a pom.xml and src directory.

`cd helloworld`

- Package the application by:

`mvn com.microsoft.azure:azure-webapp-maven-plugin:2.5.0:config`


### Deploying on Azure Web App ✋:

`mvn package azure-webapp:deploy`

Your terminal will ask us which Web App we want to deploy the maven application to. Select the one that you created using azurewebapp.tf

# azure-java-webapp
