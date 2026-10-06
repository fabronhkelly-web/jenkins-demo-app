pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Pull the latest code from GitHub
                git url: 'https://github.com/fabronhkelly-web/jenkins-demo-app.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                // "Build" the site: copy files into a clean dist folder
                echo 'Building the website...'
                sh 'rm -rf dist && mkdir -p dist'
                sh 'cp index.html dist/'
                sh 'ls -l dist'
            }
        }

        stage('Test') {
            steps {
                // Fail the pipeline if the page is missing or the heading is wrong
                echo 'Testing the build...'
                sh 'test -f dist/index.html'
                sh 'grep -q "Hello from Jenkins" dist/index.html'
            }
        }

        stage('Deploy') {
            steps {
                // "Deploy" by copying to a folder Jenkins serves files from, and save the build
                echo 'Deploying the website...'
                sh 'mkdir -p /var/jenkins_home/deployed-site'
                sh 'cp -r dist/* /var/jenkins_home/deployed-site/'
                archiveArtifacts artifacts: 'dist/**', fingerprint: true
            }
        }
    }

    post {
        success { echo 'Pipeline finished successfully!' }
        failure { echo 'Pipeline failed. Check the Console Output.' }
        always  { cleanWs() }
    }
}
