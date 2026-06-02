pipeline {
    agent any

    stages {
        stage('Preparation') {
            steps {
                echo 'Je cree un fichier de resultat.'
                sh 'echo "resultat disponible" > resultat.txt'
            }
        }

        stage('Verification') {
            steps {
                echo 'Cette verification est volontairement incorrecte.'
                sh 'test -f fichier-inexistant.txt'
                echo "Ce message n'apparaitra jamais."
            }
        }
    }
}
