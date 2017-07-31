# KEYCLOAK

## Installing Distribution Files

- keycloak-3.2.1.Final.[zip|tar.gz]
  - server only distribution
  - It contains nothing other than the scripts and binaries to run the Keycloak Server
- keycloak-overlay-3.2.1.Final.[zip|tar.gz]
  - This file is a Wildfly add-on that allows you to install Keycloak Server on top of an existing WildFly distribution
    - WildFly distributionにKeycloak Serverをインストールするための Wildfly add-on
    - WildFly distributionの root directoryに展開し、`./jboss-cli.[sh|bat] --file=keycloak-install.cli`
- keycloak-demo-3.2.1.Final.[zip|tar.gz]
  - contains the server binaries, all documentationn and all examples

## Operation Mode

サーバー運用モード

* Standalone mode
  * Standalone operating mode is only useful when you want to run one, and only one Keycloak server instance
  * productionではsingle point of failureの危険がある
* Standalone Clustered Mode
* Domain Clustered Mode

ここでは standalone modeにする



## Download

```sh
# demo version
curl -O https://downloads.jboss.org/keycloak/3.2.1.Final/keycloak-demo-3.2.1.Final.tar.gz
```

## Standalone Configuraion



## Install & Booting the Server (standalone mode)

```sh
# demo version
tar zxvf keycloak-demo-3.2.1.Final.tar.gz
cd keycloak-demo-3.2.1.Final.tar.gz
# normal version


# ./bin/standalone.sh # document用
nohup sh bin/standalone.sh > keyclock-out.log &
```

## 