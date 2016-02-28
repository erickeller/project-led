# LED project status indicator

## Introduction

This project initial idea came from our git workshop training.
In order to notice the trainees progress in resolving git exercises we asked them to rise their hands.
But after 4 hours workshop people tend to get tired and the hand rising was not a good idea anymore.

Therefore we came with the idea to create this little project, some LED indicating the progress of each and every attendee.

RED -> not ready
GREEN -> ready
BLUE -> question

the GREEN and blue states can be setup by the trainees (also called minions) with some git aliases:

```
git done
git ask
```
The RED state is setup by the git workshop trainer (also called master)

## Technology stack: etcd + confd + saltstack

