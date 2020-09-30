pipeline {
	agent any
	stages {
		stage ('BUILD IMAGES'){
			steps {
				sh "./build.sh"
			}
		}
		stage ('RUN CONTAINERS'){
			steps {
				sh "./run.sh"
			}
		}
	}
}
