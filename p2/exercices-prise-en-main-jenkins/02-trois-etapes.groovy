pipeline {
    agent any

    stages {
        stage('Preparation') {
            steps {
                echo 'Etape 1 : je prepare un resultat simple.'
                sh 'echo "portail pret" > resultat.txt'
            }
        }

        stage('Action') {
            steps {
                echo 'Etape 2 : je consulte le resultat produit.'
                sh 'cat resultat.txt'
            }
        }

        stage('Verification') {
            steps {
                echo 'Etape 3 : je verifie le resultat attendu.'
                sh 'grep -q "portail pret" resultat.txt'
                echo 'Verification reussie.'
            }
        }
    }
}
