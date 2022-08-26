author:: Andrew Farries
source:: [Collaborative database development with Spawn](https://medium.com/spawn-db/collaborative-database-development-with-spawn-fee59d6bc68b)
clipped:: [[2022-08-26]]
published:: 

#clippings #

## Spawn enables teams to collaborate effectively to solve database performance problems

![](https://miro.medium.com/max/700/0*7Wvted9IO5OosojI)

Photo by [Marvin Meyer](https://unsplash.com/@marvelous?utm_source=medium&utm_medium=referral) on [Unsplash](https://unsplash.com/?utm_source=medium&utm_medium=referral)

Database performance problems can be a pain to deal with. They frequently involve large amounts of data and require a lot of iteration to get the precise data set required to trigger the issue. And once you’ve got a reproduction database, what then? How do you share that reproduction and collaborate on the solution?

[Spawn](http://spawn.cc/) enables a workflow that makes it much easier to collaborate on reproducing and fixing database performance issues. Iterate on the reproduction by saving revisions of your database state and sharing the resulting image with people on your team with the know-how to fix the problem.

Reproducing a performance problem will likely be an iterative process. Using Spawn we can start from a backup of a database and use it to create a [data image](https://spawn.cc/docs/howto-dataimage):

sourceType: backup   
name: dev   
engine: mysql   
version: 5.7   
backup:       
  folder: mybackup  
  file: backup.sql

Spawn supports multiple database engines besides `mysql`\- see [the full list](https://spawn.cc/docs/engine-support). Creating images from scripts rather than a backup is also supported.

Once we have our image created with:

spawnctl create data-image -f image.yaml -n my-image

we can create multiple independent, isolated [data containers](https://spawn.cc/docs/howto-datacontainer) using our new image:

\> spawnctl create data-container -i my-image -n my-data-containerData container 'my-data-container' created!  
\-> Server=instances.spawn.cc;Port=31226;User Id=root;Database=mysql;Password=<redacted>

A Spawn data container is a just a regular database instance that can be connected to with whatever database development software you would normally use. As we make changes to either the schema or the data in the database, we can create regular save points:

\> spawnctl save data-container my-data-container

Each time we save, we get a new revision that can be reverted back to with:

\> spawnctl load data-container my-data-container -r rev.0

In this way we can work iteratively on the database to get a successful reproduction of the performance issue.

You’ve reproduced the problem and you’re connected to a data container that demonstrates the issue. Now what? You want to bring in more team members to help track down the issue? You could simply pass them the connection details to your data container to allow them to take a look. But what if they want to make further changes and experiments? You’re locked into a ‘[shared database’ workflow](https://betterprogramming.pub/shared-databases-are-a-thing-of-the-past-a9b186c0271e) where changes made by one developer could trample over changes made by another. This is going to make tracking down that problem much more difficult.

Fortunately, Spawn allows users to *graduate* a data container to a data image, neatly capturing and preserving the performance problem:

\> spawnctl graduate data-container my-data-container --revision rev.2 --name image-with-perf-issue

Here we have turned revision 2 of our data container into a data image. Now

\> spawnctl get data-images

shows us our new data image, ready for other team members to create their own data containers from it:

![](https://miro.medium.com/max/700/1*cuDR5lK4wys85DJ9wyNAHA.png)

Everyone in your organisation now has access to this new image, meaning that they can create a data container from the image to investigate the performance issue for themselves:

\> spawnctl create data-container image-with-perf-issueData container 'empty-pg-vypyxaze' created!  
\-> Host=instances.spawn.cc;Port=30022;Username=spawn\_admin\_vZMe;Database=postgres;Password=<redacted>

Each data container is completely independent and isolated from other data containers, despite being based on the same data image. Team members can now create their own data containers and iterate on the schema, run profilers, view query plans and alter the schema without interfering with anyone else.

Everyone in the team, including that all-important database expert, has their own sandbox to experiment in. Spawn has unlocked your team’s collaboration and parallelised the work towards a resolution.

Spawn levels up team collaboration by allowing easy sharing of database images. Got an interesting bug or gnarly performance issue in your database? Create a Spawn data image and share it with your team to find the fix that much sooner.

Spawn is in open beta. [Download the CLI](https://spawn.cc/docs/howto-installation) and get started in seconds.