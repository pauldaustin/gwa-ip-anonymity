// parameters
// ----------
// gitBranch
// gitTag
// luarocksApiKey

node ('master') {

  stage ('SCM globals') {
     sh '''
git config --global user.email "paul.austin@revolsys.com"
git config --global user.name "Paul Austin"
     '''
  }

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
        userRemoteConfigs: [[url: 'ssh://git@github.com/pauldaustin/gwa-ip-anonymity.git']]
      ])
    }
  }

  stage ('Set Version') {
    dir('source') {
      sh '''
git checkout -B version-${gitTag}
git mv kong-plugin-gwa-ip-anonymity-VERSION-0.rockspec kong-plugin-gwa-ip-anonymity-${gitTag}-0.rockspec
      '''
      sh 'sed -i "s/VERSION/${gitTag}/g" kong-plugin-gwa-ip-anonymity-${gitTag}-0.rockspec'
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

  stage ('Upload') {
    'sh luarocks upload kong-plugin-gwa-ip-anonymity-${gitTag}-0.rockspec --api-key=${luarocksApiKey}'
  }

}
