Kalaazu
=======
*The next generation in DarkOrbit private servers.*

We all know that DarkOrbit sucks, we all know DarkOrbit Private Servers sucks more, now you have the possibility to make
a private server that doesn't sucks that much.

Kalaazu is a free, open source private server designed completely from 0 and developed by the community.
It aims to achieve a complete and clean solution to all the shitty private servers that are available right now, and
free.

Development
-----------

The development takes place right here, right now. For this reason there are some channels you need to know about.

* *info* contains the information about the current and overall state of the server.
* *changelog* contains the latest commits to the repo.
* *development* is where the dev. talk takes place.

The code is hosted in github: https://github.com/manulaiko/Kalaazu and the commits are pushed as the work takes place in
*development*, if you want to propose something, discuss it there before making a pull request.

The github repo will be used to host the code and as bug tracker.
The issues should be concise and explanatories, the discussion about them belongs to *development* so any reply to the
issue that isn't in *development* is going to be ignored.

For Intellij, you may need to download JavaFx manually and add it to the project libraries.
https://gluonhq.com/products/javafx/
Chose the latest version, then extract the zip into ./vendors
Finally, add the Jar to the project libraries.
For the running configuration, add the following VM options (you must use absolute paths):
```bash
--module-path "[X]:\<path>\Kalaazu\vendors\javafx-sdk-25.0.1\lib" --add-modules javafx.controls,javafx.fxml
```

This project uses MariaDB. For local development, we provide a Docker Compose file that runs **only the database**, while you run the application from IntelliJ or the CLI.

```bash
cp .env.example .env
docker-compose up -d
```

The CSM modules runs `npm install` and `npm run build` as part of the Gradle build. You can disable by commenting out the `npmInstall` and `npmBuild` tasks in `build.gradle`.

By default, Gradle expects `npm` to be available on your `PATH`.

If Gradle fails with an error like “A problem occurred starting process 'command `npm`'”, set an override command:

- Environment variable: `NPM_CMD`
- Or Gradle property: `-PnpmCmd=...` (or in `./gradle.properties`)

If you have issues always try to stop the daemon and restart it:
```bash
./gradlew --stop
./gradlew run
```

Planning
--------

The development process is going to be hard and will take a lot of time. It will start with the architectural design
where we will discuss everything related to the software (platform, language, database, design, features, standards...).
Once the design is done, we will proceed to write the actual code and test it.

After the code has been done and tested, we could try to host it in a VPS so it can be playable, but that's not the
objective of Kalaazu, the main objective is to provide the community with a reliable and open source private server.


FAQ
---

**What does Kalaazu mean?**

The name comes from the series [Mitsuboshi Colors](https://anilist.co/anime/98439/MitsuboshiColors).

**Why are you so weeb?**

Why aren't you?

**How to fix PET?**

You can't.

**Hey, I really like your hard work and I appreciate you, can I host it in my VPS and put a lot of ads and payment
options so I can beneficiate myself thanks to your work without even giving you credits for it?**

Sure, I don't care what you do with this.

Status
------
**Architectural Design**

We have to design a solid architecture that will become the fundamental part of the private server.
