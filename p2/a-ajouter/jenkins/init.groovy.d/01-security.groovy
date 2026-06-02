import jenkins.model.*
import hudson.security.*

def instance = Jenkins.get()
def username = System.getenv('JENKINS_ADMIN_ID') ?: 'admin'
def password = System.getenv('JENKINS_ADMIN_PASSWORD') ?: 'AdminJenkinsTP2026!'

def realm = new HudsonPrivateSecurityRealm(false)
realm.createAccount(username, password)
instance.setSecurityRealm(realm)

def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(false)
instance.setAuthorizationStrategy(strategy)
instance.save()

println('Compte administrateur créé.')
