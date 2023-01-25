# Chezz
### A x86 assembly kungfu chess based on the Android game Chezz.

## Description

🔵 It's not an ordinary chess game as there are no turns, the game only ends when one of the kings is dead.

🔵 You can find two versions in the repository:
 1. `MainGame` --> A local PC Two-Player version. 
 2. `Final_Game --> Chezz` --> A server Pc Two-Player-version that can be played through two different devices.
 
🔵 Several Testcases And Cornercases have been handled successfully to simulate real world chess game.

🔵 You don't need to assemble multiple files to run the game just one file.

🔵 Photos used to draw pieces can be found in `Photos` folder.

🔵 Global version Has two modes:
 1. `Game Mode`.  
 2. `Chat Mode`.
 * Global Game has inline chatting provided.

🔵 Localversion doesn't have inline chatting or chatting modes.

## Game Rules and Guidlines

* There are no turns.
* after each piece move there is a cooldown period of 3 seconds, during this period you can't move that piece.
* checks are unlimited.
* on choosing a specific piece all available moving space will be highlighted.
* if an enemy is within the moving space it will be highlighted in red.
* Red cells are cells with pieces undergoing cooldown.
## How to run?
🔵 For the local version
* If you're using `DOSBOX` through `VSCODE` then simply copy the content of `MainGame.asm` to the workspace (no need to install DOSBOX).

🔵 For both versions to rin through DOSBOX
1. Download all files in this Repository related to a specific version.
2. Download `DOSBOX`, `MASM.exe`, `LINK.exe`.
3. Mount the Folder in the `DOSBox`.
4. Assemble the Game Folder Name in the `DOSBox` using `MASM`.
5. LINK the Game folder generated object file.
6. Type Game name and enjoy playing/



