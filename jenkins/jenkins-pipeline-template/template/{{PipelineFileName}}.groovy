pipeline {

    agent {{AGENT}}

    environment {
    }

    parameters {
        booleanParam(name: 'RELOAD_PIPELINE', defaultValue: false, description: 'Reload Jenkinsfile.')
	}

    stages {

        stage('Reload Jenkinsfile') {
            when {
                expression { params.RELOAD_PIPELINE == true } 
            }
            steps {
                echo("Reloading Jenkinsfile...")
            }
        }

        stage('pipeline') {

            when {
                not { expression { params.RELOAD_PIPELINE == true } }
            }

            stages {

				stage("initialize") {

					steps {
						script {
						}
					}
				}

			}
		}
	}

}
