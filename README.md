![logo](https://d1smxttentwwqu.cloudfront.net/wp-content/uploads/2019/04/ssl-logo.png)

[![GitHub Actions Status](https://github.com/bayrakmustafa/codesigner-docker/workflows/Docker%20Image%20CI/badge.svg)](https://github.com/bayrakmustafa/codesigner-docker)

# What is CodeSignTool?

CodeSignTool is a secure, privacy-oriented multi-platform Java command line utility for remotely signing Microsoft Authenticode and Java code objects with eSigner EV code signing certificates. Hashes of the files are sent to SSL.com for signing so that the code itself is not sent. This is ideal where sensitive files need to be signed, but should not be sent over the wire for signing. CodeSignTool is also ideal for automated batch processes for high volume signings or integration into existing CI/CD pipeline workflows.

For more information and related downloads for CodeSignTool, please visit <https://www.ssl.com/guide/esigner-codesigntool-command-guide>.

</br>

# How to use this image

## Get Credential Ids

Using env file:

```console
$ docker run -it --rm --env-file .env ghcr.io/bayrakmustafa/codesigner:latest get_credential_ids
```

Using enviroment variables:

```console
$ docker run -it --rm -e USERNAME=${USERNAME} -e PASSWORD=${PASSWORD} -e CREDENTIAL_ID=${CREDENTIAL_ID} -e TOTP_SECRET=${TOTP_SECRET} -e ENVIRONMENT_NAME=${ENVIRONMENT_NAME} ghcr.io/bayrakmustafa/codesigner:latest get_credential_ids
```

## Sign an artifact

Using env file:

```console
$ docker run -it --rm --env-file .env ghcr.io/bayrakmustafa/codesigner:latest sign -input_file_path=/codesign/examples/codesign.ps1 -output_dir_path=/codesign/output
```

Using enviroment variables:

```console
$ docker run -i --rm -e USERNAME=${USERNAME} -e PASSWORD=${PASSWORD} -e CREDENTIAL_ID=${CREDENTIAL_ID} -e TOTP_SECRET=${TOTP_SECRET} -e ENVIRONMENT_NAME=${ENVIRONMENT_NAME} ghcr.io/bayrakmustafa/codesigner:latest sign -input_file_path=/codesign/examples/codesign.ps1 -output_dir_path=/codesign/output
```

## Environment Variables
--------------

#### `Environment File (.env)`

```properties
USERNAME="SSL.com account username"
PASSWORD="SSL.com account password"
CREDENTIAL_ID="Credential ID for signing certificate"
TOTP_SECRET="OAuth TOTP Secret"
ENVIRONMENT_NAME="PROD"
```

### `USERNAME`

This variable is mandatory and specifies the SSL.com account username.

### `PASSWORD`

This variable is mandatory and specifies the SSL.com account password.

### `CREDENTIAL_ID`

Credential ID for signing certificate. If credential_id is omitted and the user has only one eSigner code signing certificate, CodeSignTool will default to that. If the user has more than one code signing certificate, this parameter is mandatory.

### `TOTP_SECRET`

OAuth TOTP Secret. You can access detailed information on https://www.ssl.com/how-to/automate-esigner-ev-code-signing

### `ENVIRONMENT_NAME`

These variables are optional, and specify the environment name. If omitted, the environment name will be set to `PROD` and use production code_sign_tool.properties file. For signing artifact with demo account, the environment name will be set to `TEST`.