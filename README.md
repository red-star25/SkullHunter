# Skullhunter - A Gaming Status App 🔥🔥🔥🔥🔥

![](https://lh3.googleusercontent.com/D83nQ5zk2ClNhmM5CUvFTgpv1jL_3NIg8BBo0-cSV75q2Zgal1o8M65e77Fq2hwlZF8)

### Skullhunter provides user the latest information about the PC,XBOX, etc Games .


### Information about the app:

```
SkullHunter provides the Latest Games , Popular Games From All Around The World.

Awesome User Interface for Ease.

It Includes:
Popular Games:
Cracked Games:
Upcoming Games:
Trending Games:

You can also view :
The Popular Game Status,
Cracked games Status,
Upcoming Game Status,

Various categories are available. So that user can easily find the Games.
```

## Screenshot 📱
![](https://lh3.googleusercontent.com/rY8JjBBUuHnT8r3qPYNqvJH4l3fXouJGw0OIytn0HlfCM1fZTuls5I_ESx4iP9KsKw72=w200-h400)
![](https://lh3.googleusercontent.com/OemvgtmOU7hYdvg7R56Qgjk2kgVK264seeS-ATaRT2B_R55YKWtDRFwBXfhSU8-s35d3=w200-h400)
![](https://lh3.googleusercontent.com/cK1HqbxYSV0QBVPJsbgapMsBD36DlLfSkU4E86bb0rw4Fnh916ahjWPHM3wVkewptZ5k=w200-h400)
![](https://lh3.googleusercontent.com/WGSblZYkNX00QblAM4tXR68bsTLg7HmMUKyfjP44dQIM2rA9Ypa67XUhlGx-mGb2C-Y=w200-h400)
![](https://lh3.googleusercontent.com/Fie7j-mtzNBFqvxA-4XB41TB7QsZQydzsI2qJFXwjRwC5SREBVIau4dN12w-ma0UY_0=w200-h400)
![](https://lh3.googleusercontent.com/Shut0RnGvDP2Pd_uqpoFMZTxXgwfOczF_LKOImjnT8lP5LFccgUW00TjdlixKKZbKtDv=w200-h400)
![](https://lh3.googleusercontent.com/KoZ34dd8IUa0wTJJN3xABWtyLR_dS20SqxBDaG7a8wUxnSQxc3cJ1Yd6558CDMBE7zWT=w200-h400)
![](https://lh3.googleusercontent.com/BzalJUI03GaOu_fd_2iuuEfMLs_KQ7FItilYpo3Q9AsI4TgPWuhidEky-xU8LnPjM_k=w200-h400)

### Show some ❤️ and star the repo to support the project
![](https://github-images.s3.amazonaws.com/help/bootcamp/Bootcamp-Fork.png)

# Building the project 📽

Missing Key.Properties file ❌❌

If you try to build the project straight away, you'll get an error complaining that a key.properties file is missing and Exit 🚪

You have to create your own key and run it (You can follow following steps😉).

1. Open \android\app\build.gradle file and paste following lines without comments.
```
//keystoreProperties.load(new FileInputStream(keystorePropertiesFile))

signingConfigs {
// release {
// keyAlias keystoreProperties['keyAlias']
// keyPassword keystoreProperties['keyPassword']
// storeFile file(keystoreProperties['storeFile'])
// storePassword keystoreProperties['storePassword']
// }
}
buildTypes {
// release {
// signingConfig signingConfigs.release
// }
}
```

2.Open \android\local.properties and add -
```
flutter.versionName=1.0.0
flutter.versionCode=1
flutter.buildMode=release
```


Or you can follow from the Official Doc.https://flutter.dev/docs/deployment/android.


<p>
<a href="https://play.google.com/store/apps/details?id=com.nakumsdtech.gameapi"><img src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" alt="Waller"></a>
</p>

❤ Found this project useful?
If you found this project useful, then please consider giving it a ⭐ on Github and sharing it with your friends via social media.

### LinkedIn Profile
<p>
<a href="https://www.linkedin.com/in/dhruv-nakum-4b1054176/"><img src="https://img.icons8.com/ios-filled/2x/linkedin.png" alt="LinkedIn"></a>
</p>
