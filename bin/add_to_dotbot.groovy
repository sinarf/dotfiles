#!/usr/bin/env groovy

import groovy.yaml.*

/**
* This script can be used to add file or directory to dotbot. 
* The script does move the file or the directory to the dotbot 
* @author sinarf
*/
String HOME = System.getenv("HOME")
final String DEFAULT_DOTFILES_HOME="$HOME/.dotfiles"
final String DOTBOT_CONFIG_FILE="install.conf.yaml"

if (args.length != 1){
   System.err.println("This script takes one and only one argument")
   System.exit 1
}

//Read dotbot config file
String dotfilesHome = System.getenv("DOTFILES_HOME") ?: DEFAULT_DOTFILES_HOME
println "Looking for $DOTBOT_CONFIG_FILE in $dotfilesHome..."
File dotbotConfigFile = new File(dotfilesHome + '/' + DOTBOT_CONFIG_FILE)
String dotbotConfigFileFound = dotbotConfigFile.exists()
if (dotbotConfigFileFound)
    println "Dotbot config file found: $dotbotConfigFile.absolutePath"
else{ 
    System.err.println("Config file $DOTBOT_CONFIG_FILE is not found in $dotfilesHome")
    System.exit 2
}
def config = new YamlSlurper().parse(dotbotConfigFile)

// the object config.link contains a list of map where only one list is not null
// so we choose that one.
Map links = [:]
config.link.each { currentMap ->
     if (currentMap) links = currentMap
} 

File itemToAdd = new File(args[0])
if (!itemToAdd.exists()) {
    System.err.printtln("$itemToAdd.name doesn't exist.")
    System.exit 3
}

def ant = new AntBuilder()

// The target dir have the 
File targetDir = new File(dotfilesHome + '/' + itemToAdd.name)

if (targetDir.exists()){
    System.err.println("The targetDir ${targetDir.absolutePath} already exists!")
    System.exit 4
}
    

println "Creating the targetDir: ${targetDir.absolutePath} "
targetDir.mkdirs()

if (itemToAdd.directory){ 
    ant.move(
        todir:targetDir,
        overwrite: false,
        force: false,
        verbose: true,
        flatten: false,
        file:itemToAdd.absolutePath
    ) 
    Map value = [:]
    value.put(itemToAdd.absolutePath, dotfilesHome)
    value.put("create", true)
    links.put(itemToAdd.absolutePath, value)
    }
else if (itemToAdd.file) {
    ant.move(
        todir:targetDir,
        overwrite: false,
        force: false,
        verbose: true,
        flatten: false,
        file:itemToAdd.absolutePath
    )
    links.put(itemToAdd.absolutePath, "${targetDir}/${itemToAdd.name}")
}
else throw IllegalArgumentException("$itemToAdd.absolutePath is not a file or a directory")  

println "Updtating dotbot configuration"
def configBuilder = new YamlBuilder()
configBuilder.call config
dotbotConfigFile.write(configBuilder.toString())

println "Now you should run the `./install` script and commit your change"
