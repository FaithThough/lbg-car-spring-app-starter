pipeline{

environment {

registry = "faiththough/carspring"

        registryCredentials = "12875cab-5653-40f1-a132-7fb3286d3ae6"

        dockerImage = ""

    }

    agent any

        stages {

            stage ('Build Docker Image'){

                steps{

                    script {

                        dockerImage = docker.build(registry)

                    }

                }

            }
 
            stage ("Push to Docker Hub"){

                steps {

                    script {

                        docker.withRegistry('', registryCredentials) {

                            dockerImage.push("${env.BUILD_NUMBER}")

                            dockerImage.push("latest")

                        }

                    }

                }

            }
 
            stage ("Clean up"){

                steps {

                    script {

                        sh 'docker image prune --all --force --filter "until=48h"'

                           }

                }

            }

        }

}
 