# Journal of Research Objetcs

The project is curretly in development using frameworks and tools from Hyperledger, in particular [Fabric](https://hyperledger-fabric.readthedocs.io/en/release-1.1/) and [Composer](https://hyperledger.github.io/composer/latest/introduction/introduction)  


The business network is designed to capture the interactions between researchers within the academic community as well as participants from outside of the academia. The interactions involve digital research objetcs, that are shared and traded as assets accross a network. Some examples of digital research objects are: documents, presentations, datasets, code, among other object considered as valuable in the process of creating knowledge in a disciple onr accross many disicplines. A basic setup of a business network involves the digital research objets as `assets` and researchers and institutions as `participants`. These `participants` exchange the `assets` using different types of `smart contracts`. The business network may be used to register interactions among `participants`, provide tractability for the value creation process in science and it may include a system of `tokens` to reward interactiosn among participants.     

We will be posting updates on different versions of the business network `jro` that can be used both in the [Composer Playground](https://composer-playground.mybluemix.net/) or can be deployed locally in Fabric. The individual files that make up the business network archive are in the directory `jro` of the repository.

First we need to intall the version of node and npm that is compatible with composer and fabric.
`````
nvm install 8.9
`````

## Fabric Network Design

This step

The [jro](https://github.com/Blockchain4openscience/CERVER_JRO/tree/master/jro) folder contains the bussines network definition and a bussiness network archive called __jro@0.1.1.bna__ generated from this definition . If you wish, you can generate a business network archive with:

```
composer archive create -t dir -n .
```

After creating the .bna file, the business network can be deployed to the instance of Hyperledger Fabric, [bootstrap a simple fabric network](https://hyperledger.github.io/composer/latest/tutorials/deploy-to-fabric-single-org).

In the folder used for Fabric there is a subfolder named `fabric-tools` where we can find the scripts (o archivos *.sh) to start, stop and destroy a basic Fabric node. Copy into the subfolder `fabric-tools` the script `stopjr.sh`. This script allow to clean up the develpment enviorment after using the application (the last step in the process).

We can start the local Fabric node with

`````
./startFabric.sh
`````

2. [Step Two: Exploring the Hyperledger Fabric network](https://hyperledger.github.io/composer/latest/tutorials/deploy-to-fabric-single-org)

3. [Step Three: Building a connection profile](https://hyperledger.github.io/composer/latest/tutorials/deploy-to-fabric-single-org)

4. [Step Four: Locating the certificate and private key for the Hyperledger Fabric administrator](https://hyperledger.github.io/composer/latest/tutorials/deploy-to-fabric-single-org)

After these first steps you should have a folder called `certificates` with the connection profile `connection.json`, a certificate `Admin@org1.example.com-cert.pem` and a private key for the administrator of the Fabric node `114aab0e76bf0c78308f89efc4b8c9423e31568da0c340ca187a9b17aa9a4457_sk`.

Also save into the folder `certificates` the script `startjro.sh` and the business network application file `jro@0.1.1.bna` found in this repo.


## Deploying the smart contract and business logit onto the Fabric node.

To deploy the business network application `jro@0.1.1.bna` we can use the following script,

`````
sh jrostart.sh
`````

After the script has run you can veryfy the connection to the node with the following command,

`````
composer network ping -c admin@jro
`````
The generated API is connected to the deployed blockchain and business network.

## Composer Rest Server

Launch your browser and go to the URL given [http://localhost:3000/explorer](http://localhost:3000/explorer) for interacting with it. Rest server generates an endpoint for each participant, asset and transaction of the business network definition. Go to the [business model](https://github.com/Blockchain4openscience/jroBna/tree/master/jro) to review all operations in the rest server. yo can use a api environment tool (e.g. [Postman](https://www.getpostman.com/)) to send Http Request to Hypeledger. 

Additionally you can run hyperledger playground to see easily the changes in the components of the business model. 

```
composer-playground
```

## Destroy a previous set up
After testing the bna desgined with Composer and deployed onto Fabric it is important to tidy up by stopping fabric. Navigate to the folder where you initially started the Hyperledger Fabric network.

`````
sh stopjro.sh
`````