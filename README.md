# Timepaper (XFCE)

### Explanation of timepaper.sh
1. Determine time
2. Select directories to choose based on time (refer to usage)
3. Randomly select an image from any of the directories selected
4. Apply image to all workspaces
5. Wait 15 minutes, then steps 1-4

## Requirements
XFCE. Script is designed for the XFCE environment

## Installation

1. Clone the repo by running
```
git clone https://github.com/No-Git-Tag/Dynamic-wallpapers-XFCE
```
2. Run install.sh with
    ```
    bash install.sh
    ```
3. Reboot system and it should be ready!

## Usage

 Once installed, place your wallpapers within the directories:
   - `Morning` (all day, all night)
   - `Day` (10 AM - 5 PM)
   - `Evening` (6 AM - 8 PM)
   - `Night` (8 PM - 6 AM)

To manually run the script post-installation, you can execute:

```
bash ~/timepaper.sh
```
