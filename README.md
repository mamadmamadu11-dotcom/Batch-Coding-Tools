# 🛠️ Batch-Coding-Tools

> **Windows Batch Scripts** for AI-assisted coding workflows

[![Made with Batch](https://img.shields.io/badge/Made%20with-Batch-4D4D4D?style=flat&logo=windows)](https://github.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

---

## 📦 What's Inside

| File | Function | Use Case |
|------|----------|----------|
| `filelist.bat` | 📋 Lists all files in project | Find that one icon or config file |
| `find.bat` | 🔍 Finds and copies specific files | Extract selected icons or assets |
| `svgcolor.bat` | 🎨 Batch color SVG files | Change all SVGs to white/any color |
| `organize_by_name.bat` | 📚 Merges all code into one text file | Feed your whole project to AI |

---

## 🚀 Quick Start

1. **Download** the `.bat` file you need
2. **Place** it in your project folder
3. **Double-click** to run
4. **Done!** Check the generated output file

### Example Workflow:

```bash
# Find all SVG icons and copy to SelectedIcons folder
> find.bat

# Color all SVGs white (or any color you want)
> svgcolor.bat

# Send your whole project to ChatGPT/Claude for review
> organize_by_name.bat
```

---

## 💡 Why These Tools?

### The Problem:
When working with AI coding assistants, you often need to:
- Find specific files in a huge project with deep folders
- Share your entire codebase for AI review
- Batch process files (like changing SVG colors)
- Extract icons or assets quickly

### The Solution:
**4 tiny scripts** that do all of this with one click!

No installation needed. No dependencies. Just download and run.

---

## 📖 Detailed Usage

### 1️⃣ `filelist.bat` - File Lister
Lists **every file** in your project and subdirectories.

```
Output: FileList.txt
```

**Use case:** Need to find a specific icon but don't know where it is? Run this, give the list to AI, and AI will tell you the exact filename!

---

### 2️⃣ `find.bat` - File Finder & Copier
Finds predefined files and copies them to `SelectedIcons/` folder.

**Default files it looks for:**
- `arrows-rotate.svg`, `repeat.svg`
- `person-walking.svg`, `person-running.svg`
- `bicycle.svg`, `bolt.svg`, `car.svg`
- `play.svg`, `forward-step.svg`, `forward.svg`, `forward-fast.svg`

```
Output: SelectedIcons/ (folder containing copied files)
```

**💡 Tip:** You can edit the `FilesToCopy` variable in the script to add your own files!

---

### 3️⃣ `svgcolor.bat` - SVG Color Changer
Batch processes all SVG files in your project:
- Removes comments
- Strips existing fill colors
- Applies new fill color (default: `#FFFFFF`)

```
🎨 Default color: White (#FFFFFF)
```

**💡 Tip:** Want a different color? Open the script and change `#FFFFFF` to any hex color like `#FF0000` (red) or `#00FF00` (green)!

---

### 4️⃣ `organize_by_name.bat` - ⭐ The Star Tool!
Merges **ALL your code files** into a single text file.

**Features:**
- ✅ Includes file name and full path as header
- ✅ Skips binary files (images, executables, etc.)
- ✅ Skips itself and output file
- ✅ Clean, readable format

```
Output: Project_Source_Code.txt
```

**Perfect for:**
- Giving AI full context of your project
- Code reviews by AI
- Creating documentation
- Backing up code structure

---

## 🎯 Real-World Use Cases

### Scenario 1: Find a specific icon
```bash
1. Run filelist.bat
2. Give FileList.txt to ChatGPT/Claude
3. Ask: "Which file is the play icon?"
4. AI tells you: "play.svg is in assets/icons/"
5. Run find.bat to extract it
```

### Scenario 2: Prepare code for AI review
```bash
1. Run organize_by_name.bat
2. Get Project_Source_Code.txt
3. Upload to ChatGPT/Claude
4. Ask: "Review my code for bugs and improvements"
```

### Scenario 3: Batch process SVG assets
```bash
1. Drop svgcolor.bat in your project root
2. Run it
3. All SVGs are now white (or any color you set)
4. Perfect for dark mode UI!
```

---

## 🔧 Customization Guide

### Change SVG Color (svgcolor.bat)
Find this line in the script:
```batch
$content = $content -replace '<svg\s', '<svg fill="#FFFFFF" '
```
Replace `#FFFFFF` with your desired hex color.

### Add More Files to Find (find.bat)
Find this line:
```batch
set "FilesToCopy=arrows-rotate.svg repeat.svg ..."
```
Add your own files separated by space.

### Exclude More File Types (organize_by_name.bat)
Add more extensions to skip:
```batch
if /I "%%~xF"==".pdf" set "Skip=1"
if /I "%%~xF"==".doc" set "Skip=1"
```

---

## 🤝 Contributing

Contributions are welcome! Here's how:

1. Fork this repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Ideas for contributions:
- Add more color options for SVG
- Create a GUI version
- Add support for Linux/Mac
- More file filters for organize_by_name

---

## 📄 License

Distributed under the MIT License. See `LICENSE` file for more information.

---

## ⭐ Support

If you find these tools useful:
- **Star** ⭐ this repository
- **Share** with fellow developers
- **Report** issues or suggest features

---

## 📬 Contact

Have questions? Open an issue or reach out!

---

**Made with ❤️ for the AI developer community**

*"Automate the boring stuff so you can focus on what matters."*
```
