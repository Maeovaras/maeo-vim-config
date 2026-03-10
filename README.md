# Vim Configuration

This backup contains the latest .vimrc file and instructions for importing it into a new Linux environment.

## What's Included:
- **Custom Yellow Buffer Line (Top)**: Quick buffer navigation.
- **Orange Status Line (Bottom)**: File details with black text.
- **File Type Highlight**: Black text on white background in the status line.
- **Blue Line Numbering**: With a gray background.
- **Bright Green Active Line Number**: Highlights the current line (Color 46).
- **Floating Cheat Sheet**: Compact list of commands in the top-right corner.
- **Shortcuts**: Tab for next buffer, Shift+Tab for previous buffer.

## How to Import:

1. **Copy the .vimrc file:**
   Copy the .vimrc file from this backup to the home directory of your new environment.
   ```bash
   cp .vimrc ~/.vimrc
   ```

2. **Verify Vim Version:**
   The floating cheat sheet requires Vim 8.2 or higher. Verify your version:
   ```bash
   vim --version
   ```

3. **Open Vim:**
   Your new settings will be applied automatically.

## Troubleshooting:
If colors are off, ensure 256-color support:
```bash
export TERM=xterm-256color
```
