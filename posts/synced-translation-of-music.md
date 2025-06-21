---
layout: main
---

### Synced translation of lyrics on music streaming apps

The amount of non-English music on subscription music streaming apps (e.g., Spotify, Apple Music) has increased tremendously in the past few years.

This means that people who do not understand the language but like the music can now easily listen to it. Most new music on Spotify has karaoke-style lyrics - the lyrics are synced to the music. For non-English songs, the lyrics are written in the original language of the song. An option to have the karaoke-lyrics translated to English would allow people with limited to no understanding of the original language to better appreciate and enjoy the meaning of these songs.  

Spotify gets their karaoke-lyrics from [Musixmatch](https://www.musixmatch.com/). How does Musixmatch get their data? It may be a combination of community submitted lyrics and artist/record label submissions. They also have English translations of non-English songs on their website - the feature we want to integrate into Spotify. Here is what it looks like for TQG, a recent Spanish song: [link](https://www.musixmatch.com/lyrics/KAROL-G-7/TQG/translation/english). Users can see the matched English lyrics but there seems to be no way to listen to the song while following along. 

How are the translations created? It could be user submitted or machine translated. If I worked at Musixmatch, the latter would be preferable. Let us consider the goals of a translation in this setting. It is for exposing non-language speakers to the overall meaning of the song. Being completely accurate and capturing the nuances of the words is not the primary endpoint. For a given song in language X, we run it through a machine translator to get the word-for-word lyrics in language Z. We have a word by word translation and simply substitute the words while perserving the sync from language X. 

I suspect this feature could be useful in helping people passively learn new languages? In my opinion, music makes it easier to remember words and phrases. 

How would Musixmatch integrate this feature into a music streaming platform? Let us consider Spotify. The lyrics are already displayed and synced for most songs and are available when users click on a song and scroll down. A button on the lyrics screen could be added so that when clicked it now displayes the synced translated English lyrics. When users click the button, the app calls on the Musixmatch API responsible for translation and displays the results. The translation happens in real-time and is not pre-computed. The original language lyrics can be saved on the cloud, and when the button is pressed, this file is sent to a machine translator and the output file is sent back down to the local machine to be displayed on Spotify. 

What translator should we use? An internally built one or a third-party like Google Translate. A third-party translator is the easiest option to implement because all it requires is a call through an API. The limitations are: a) giving up data to the third-party, and b) dependency on their service and codebase. An internally built translator means we have full control over it but would require more time, money, and manpower to build and maintain. The decision would be based on answering the following question: Is the data that we give up to the third-party significantly detrimental to our own business? I suspect not because Google can collect this lyric data from other lyric aggregators too like Genius and LyricFind. 

Spotify uses Musixmatch, Apple music uses Genius and Amazon uses LyricFind and Musixmatch [source](https://techcrunch.com/2021/11/18/spotify-finally-rolls-out-real-time-lyrics-to-global-users/). Musixmatch offers a translated lyrics feature to paying customers [here](https://about.musixmatch.com/business/features). Spotify has chosen not to include this feature in their deal with Musixmatch. Depending on the cost of adding this feature, Spotify should offer translated karaoke lyrics to users. If price was prohibitive, could Spotify just take the lyrics given to them by Musixmatch and call the translator themselves? I wonder if this is prohibited based on the contract Spotify has signed with Musixmatch already. If not, Spotify should do this immediately. 










