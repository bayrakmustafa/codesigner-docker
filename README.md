# Sign with CodeSignTool

[![GitHub Actions Status](https://github.com/bayrakmustafa/codesigner-docker/workflows/Docker%20Image%20CI/badge.svg)](https://github.com/bayrakmustafa/codesigner-docker)

CodeSignTool is a secure, privacy-oriented multi-platform Java command line utility for remotely signing Microsoft Authenticode and Java code objects with eSigner EV code signing certificates. Hashes of the files are sent to SSL.com for signing so that the code itself is not sent. This is ideal where sensitive files need to be signed, but should not be sent over the wire for signing. CodeSignTool is also ideal for automated batch processes for high volume signings or integration into existing CI/CD pipeline workflows.