unity-chess-shader
===
An improved chessboard-style fragment shading demo for Unity 5 based on the [original Unity chessboard shader sample][1] with improvements from [GPU Gems: Chapter 25: Fast Filter-Width Estimates with Texture Maps][2].

![][3]

## Features

- Ready-to-run Unity 5 test project.
- Five chessboard shaders:
  - Original chessboard shader #1 from the Unity manual.
  - Original chessboard shader #2 from the Unity manual.
  - Improved derivative-based shader w/ antialiasing (using fwidth).
  - In Progress: Improved derivative-based shader w/ antialiasing (not using fwidth).
  - In Progress: Improved texture-based shader.
- External antialiasing as a post-effect (for comparison) including FXAA, NFAA, SSAA, DLAA, etc.

## Use

1. Open the `ChessShader.Unity` project folder in Unity 5+.
2. Open the `Test` scene.
2. Select the `Plane` object in the scene hierarchy or the `ChessSimple` material in the Assets browser.
4. Change the active shader using the Inspector.
5. Optionally enable or disable antialiasing post-effects by selecting the Camera object in the hierarchy and enabling or disabling its custom `Antialiasing` component in the Inspector. All shaders can be run with or without external AA.
6. Hit Play to run the scene. Shaders and AA can also be changed on the fly when the scene is running.

## License

MIT.

[1]: http://docs.unity3d.com/Manual/SL-VertexFragmentShaderExamples.html
[2]: http://http.developer.nvidia.com/GPUGems/gpugems_ch25.html
[3]: assets/chess_shader_anim.gif
