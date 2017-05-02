Google Cloud Platform SDK
=========================


# Cloud SDK install

## Install by download
<https://cloud.google.com/sdk/docs/quickstart-mac-os-x>

download & `./install`

## Install by curl

```
curl https://sdk.cloud.google.com | bash
```
## Setup

### pathが自動で追加されるが、fish shellを使っているなら手動で追加

```fish
# The next line updates PATH for the Google Cloud SDK.
bass source '/Users/hunter/bin/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
bass source '/Users/hunter/bin/google-cloud-sdk/completion.bash.inc'
```

### installが完了したら update

`gcloud components update`

```
gcloud init

> Enter project id you would like to use: googleで作成したprojectのidを入れる
```



# About SDK

## gcloud

gcloudは google Cloud SDKの一部

## gcloud compute

<https://cloud.google.com/compute/docs/gcloud-compute/>

## sdk update

`gcloud components update`


## instance list

`gcloud compute instances list`




# References

+ <https://cloud.google.com/compute/docs/gcloud-compute/?hl=ja>
+ <https://cloud.google.com/sdk/>
+ <https://developers.google.com/cloud/sdk/gettingstarted>
+ [gcloud tool guide](https://cloud.google.com/sdk/gcloud/)
