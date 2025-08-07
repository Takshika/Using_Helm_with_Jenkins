node {
    // Checkout the source code from the SCM (Source Control Management) configured for this Jenkins job
    checkout(scm)
    
    // Stage 1: Download Promitor repositories or required files by running a shell script
    stage ('Downloading promitor repos') {
        // Run the shell script named 'promitor.sh' which likely pulls Promitor dependencies or repos
        sh 'sh promitor.sh'
    }
    
    // Stage 2: Install or upgrade the Promitor pod using Helm
    stage("Installing Promitor Pod") {
        // Helm command to install or upgrade a release named 'promitor-agent-scraper'
        // Uses the custom metric-declaration.yaml values file from promitor-chart folder
        sh 'helm upgrade --install promitor-agent-scraper --values=promitor-chart/metric-declaration.yaml promitor-chart'
    }
    
    // Stage 3: Check the status of the deployed pods and create a port-forward to access Promitor UI/metrics
    stage("Pod Check") {
        // List all pods in the current Kubernetes context to verify deployment status
        sh 'kubectl get pods'
        
        // Forward local port 8080 to port 88 of the Promitor pod 'promitor-agent-scraper-69f8f985ff-kndmg'
        // The trailing '&' runs the command in background (so Jenkins pipeline does not hang)
        sh 'kubectl port-forward promitor-agent-scraper-69f8f985ff-kndmg 8080:88&'
    }
}
