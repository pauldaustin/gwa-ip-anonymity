// parameters
// ----------
// gitTag

def replace = { File source, String toSearch, String replacement ->
  source.write(source.text.replaceAll(toSearch, replacement))
}
    
node ('master') {
  def artifactoryServer = Artifactory.server 'prod'
  def mavenRuntime = Artifactory.newMavenBuild()
  def buildInfo

  stage ('Checkout') {
    dir('source') {
      deleteDir()
      checkout([
        $class: 'GitSCM',
        branches: [[name: '${gitBranch}']],
        doGenerateSubmoduleConfigurations: false,
        extensions: [],
        gitTool: 'Default',
        submoduleCfg: [],
        userRemoteConfigs: [[url: 'ssh://git@github.com/bcgov/gwa-ip-anonymity.git']]
      ])
    }
  }

  stage ('Set Version') {
    dir('source') {
      sh '''
git checkout -B version-${gitTag}
git mv kong-plugin-gwa-ip-anonymity-VERSION-0.rockspec kong-plugin-gwa-ip-anonymity-${gitTag}-0.rockspec
'''
      replace('kong-plugin-gwa-ip-anonymity-${gitTag}-0.rockspec', 'VERSION', '${gitTag'})
    }
  }

  stage ('Tag') {
    dir('source') {
      sh '''
git commit -a -m "Version ${gitTag}"
git tag -f -a ${gitTag} -m "Version ${gitTag}"
git push origin ${gitTag}
      '''
    }
  }


  stage ('Deploy') {
  }

}
