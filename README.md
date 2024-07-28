# Appeye

## 👀 iOS App size monitoring charts

![Pipeline](/diagrams/AppEye-Pipeline.png)

CI/CD pipeline is used to build the app and publish it on TestFlight. After the archive stage in the pipeline, we have added an additional step to automate the monitoring of app size. 

The app is monitoring is divided into following steps:

1. PUBLISH REPORT: iOS app is generated with an app thinning report which is then sent to the central function in the common shared libraries.

2. PARSE AND UPLOAD APP SIZE: Next, we parse the app thinning report and parse the app size from the report. The app size is then uploaded to the artifactory.

3. GET APP SIZE OF DEFAULT BRANCH: In this step, we get the app size of the default branch(master)  and then, calculate the difference between the master’s app size and current branch app size.

4. REPORT APP SIZE DELTA - PR COMMENTS: The difference in app size and delta is reported as PR comments.

5. REPORT APP SIZE DELTA: The app size delta is also reported on other channels: Slack, Email, etc.

6. APP SIZE DELTA - PR CHECKS: Necessary checks can be added on the PR for app size with required configurations.

App Eye is a tool built to give pictorial representation of the app size. This tool gives a tree map chart of components of iOS app/widget, which includes app contents, images, assets, third party libraries, etc.
App Eye tool also gives a git style difference between the app size of two app versions, where RED color indicates increase in app size for the given file/directory and GREEN color indicates a decrease in app size.

![TreeMap](/diagrams/AppEye-Diagram.png)

App Eye tool uses the following two open source things:

1. GOOGLE TREEMAP: Charting Library available by google. (https://developers.google.com/chart/interactive/docs/gallery/treemap)

2. ACEXTRACT: Tool to read/extract the contents of car file.
(https://github.com/bartoszj/acextract)

![Pipeline](/diagrams/AppEye-Pipeline2.png)

### Key Points :

1. We use this tool to monitor the app size with each of the components in detail.
2. This tool is centralized and can be used by any iOS app/ widget.
3. The details of the app size are provided at a high level with the tree charts.
4. The simplified view can be understood and decrypted by anyone in the team.
5. The tool does not need you to archive the app again, and can use the packed iOS binary.
