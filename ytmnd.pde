// Import Minim
import ddf.minim.*;
import ddf.minim.effects.*;

// Import GifAnimation
import gifAnimation.*;

/**
 * 
 * You're The Man Now, Dog
 *
 * Author: Ramzi Abdoch.
 *
 */

ArrayList<Gif> gifs;  // Tile of Gifs in fullscreen
Gif gif;

// Frame Data
PImage[] allFrames; // PImages of each frame
int numFrames;  // The number of frames in the animation
int currentFrame = 0;
int gif_width, gif_height, num_gif_x, num_gif_y;
    
// Music Data
Minim minim;
AudioPlayer groove;
    
void setup() { 
  
  frameRate(24);
  fullScreen();
  
  // Fill in gif data
  gif = new Gif(this,"img/gif.gif");
  allFrames = Gif.getPImages(this, "img/gif.gif");
  numFrames = allFrames.length;
  gif_width = allFrames[0].width;
  gif_height = allFrames[0].height;
  
  // Fill in audio data
  minim = new Minim(this);
  groove = minim.loadFile("mp3/sad_violin.mp3", 2048);
  
  // Loop Gif
  gif.loop();
  
  // Loop groove
  groove.loop();
    
  // Count num_images possible in fullscreen
  num_gif_x = width / gif_width;
  num_gif_y = height / gif_height;
} 
 
void draw() { 
  background(0);
  
  // Draw Gifs
  for (int i = 0; i <= num_gif_x; i++){
    for (int j = 0; j <= num_gif_y; j++){
      image(gif, i * gif_width, j * gif_height); 
    }
  }
}