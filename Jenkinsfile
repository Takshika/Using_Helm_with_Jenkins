node {
    checkout(scm)       
        stage ('Downloading promitor repos'){
            sh 'sh promitor.sh'
        }
        stage("Installing Promitor Pod"){
            sh 'helm upgrade --install  promitor-agent-scraper  --values=promitor-chart/metric-declaration.yaml promitor-chart'
        }
        stage("Pod Check"){
            sh 'kubectl get pods'
            sh 'kubectl port-forward promitor-agent-scraper-69f8f985ff-kndmg 8080:88&'
        }
}

