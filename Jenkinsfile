pipeline {
	agent any
	stages {
		stage ('BUILD IMAGES AND PUSH TO NEXUS'){
			steps {
				sh "./build.sh"
				sh "./push.sh"
			}
		}
		stage ('RUN CONTAINERS'){
			steps {
				sh "./run.sh"
			}
		}
	}
}
