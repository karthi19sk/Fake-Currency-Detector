# Fake-Currency-Detector

Ocatve code that performs morphological operations to identify if the given Ethiopian paper currency is real or fake based on a single security feature is implemented.




Security feature:

*Every Original Ethiopian currency has a vertical strip in the centre that contain exactly a set of pixels forming one connected component.




Step by step procedure:

1. The input image is compressed to 320*120 pixels or closer resolution.

2. The image is cropped to obtain pixels bw 103-108 horizontally, containing the vertical strip.

3. The noise due to dirt and flashlight are removed by selecting the pixels above a fixed saturation thrseshold and below a fixed 
intensity threshold respectively.

4. imclose(): erosion followed by dilation removes additional noises to give a sharp edged image.

5. bwareaopen(img,15): removes all disconnected components or smaller connected components that contain less than 15 pixels.

6. bwlabel(areaopen): Returns the number of connected pixels containing 15 or more pixels.

7. real/fake: if there exists 1 connected set, then the note is real else it is fake.
