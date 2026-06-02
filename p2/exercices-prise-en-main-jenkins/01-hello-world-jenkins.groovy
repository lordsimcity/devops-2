pipeline {
    agent any

    stages {
        stage('Hello World') {
            steps {
                echo 'Hello World ! Jenkins exécute mon premier pipeline.'
                echo 'Un résultat vert signifie que les étapes demandées ont réussi.'
            }
        }
    }
}
