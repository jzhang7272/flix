# Project 2 - *Flix*

**Flix** is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: 15 hours spent in total

## User Stories

The following **required** functionality is complete:

- [X] User sees an app icon on the home screen and a styled launch screen.
- [X] User can view a list of movies currently playing in theaters from The Movie Database.
- [X] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [X] User sees a loading state while waiting for the movies API.
- [X] User can pull to refresh the movie list.
- [X] User sees an error message when there's a networking error.
- [X] User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

The following **optional** features are implemented:

- [X] User can tap a poster in the collection view to see a detail screen of that movie
- [X] User can search for a movie.
- [X] All images fade in as they are loading.
- [ ] User can view the large movie poster by tapping on a cell.
- [X] For the large poster, load the low resolution image first and then switch to the high resolution image when complete.
- [ ] Customize the selection effect of the cell.
- [ ] Customize the navigation bar.
- [X] Customize the UI.
- [ ] User can view the app on various device sizes and orientations.
- [X] Run your app on a real device.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Implementing a "Sort By" feature, with date of release, alphabetical, or ratings/popularity
2. Implementing a third tab for "Favorites" or "To Watch" 
3. Adding popup error messages for errors.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://i.imgur.com/fgpj4aR.gif' title='App Walkthrough' width=''/>
https://i.imgur.com/fgpj4aR.gif
<img src='https://i.imgur.com/17u90TW.gif' title='No Internet' width=''/>


GIF created with [Kap](https://getkap.co/).

## Notes
I struggled with implementing the search bar at first, as my original method for doing so did not make full use of NSPredicate, and used an inefficient method with dictionaries. I also wanted to try implementing the activity indicator programatically, so I spent more time trying to understand that. I spent a lot of time on the earlier stages in trying to fix small UI mistakes, and thus I didn't have more time later to work on more advanced UI design.

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
