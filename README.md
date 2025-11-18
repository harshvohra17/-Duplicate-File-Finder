# 🧩 Duplicate File Finder — Unix Edition

## 👩‍💻 Author Details  
**Roll No:** 241033004  
**Course:** Unix Lab Project  
**Submitted by:** Harsh Vohra 

---

## 🛡️ Project Title  
**Duplicate File Finder — Unix Edition**

---

## 📖 Overview  

The **Duplicate File Finder** is a **menu-driven shell script** developed as part of a Unix Lab project.  
It helps users identify and manage **duplicate files** in a specified directory using Unix commands and scripting logic.

The tool enhances file organization and saves disk space by scanning directories, listing duplicate files, and allowing deletion or report generation — all from a simple, color-coded terminal interface.

---

## 🎯 Project Objectives  

- To practice **Unix shell scripting** and file handling.  
- To automate the process of finding **duplicate files** using hashing.  
- To provide a **user-friendly, menu-driven interface**.  
- To allow users to **save reports** and **view duplicates**.  
- To understand the use of commands like `find`, `md5sum`, and `awk`.

---

## ⚙️ Key Functionalities  

| Feature | Description |
|----------|-------------|
| 🔍 **Scan Directory** | Scans the given directory recursively for duplicate files based on file content (hash). |
| 📋 **Show Duplicates** | Displays duplicate files in a formatted list. |
| 🚪 **Exit** | Safely exits the program. |

---

## ⚙️ Commands Used in the Project (macOS Compatible)
## 🧩 Core Commands
| **Command**                    | **Description**                             | **macOS Equivalent / Notes**                     |
| ------------------------------ | ------------------------------------------- | ------------------------------------------------ |
| `echo`                         | Prints text or messages in the terminal     | Used to display menu and messages                |
| `read`                         | Reads user input from the terminal          | Used for folder path and menu selection          |
| `find`                         | Searches for files in a directory hierarchy | Used to scan folders for duplicate files         |
| `md5`                          | Calculates MD5 checksum for files           | macOS version of `md5sum`                        |
| `sort`                         | Sorts lines of text files                   | Used to prepare checksum data for comparison     |
| `uniq -D`                      | Prints duplicate lines                      | Used to detect duplicate files based on checksum |
| `cat`                          | Displays content of a file                  | Used to show duplicate results                   |
| `mktemp`                       | Creates a temporary file                    | Used to store scan data temporarily              |
| `chmod +x duplicate_finder.sh` | Makes the script executable                 | Required to run script in macOS terminal         |
| `./duplicate_finder.sh`        | Runs the shell script                       | Used to execute the program                      |
| `git add .`                    | Stages all modified files                   | Used for saving changes to Git                   |
| `git commit -m "message"`      | Commits changes to Git                      | Saves project progress                           |
| `git push origin main`         | Pushes local commits to GitHub              | Uploads project updates                          |

## 🧠 macOS Compatibility Adjustments
| **Linux Command**    | **macOS Equivalent**                 | **Purpose**                                     |
| -------------------- | ------------------------------------ | ----------------------------------------------- |
| `md5sum`             | `md5`                                | To calculate checksums (used in duplicate scan) |
| `uniq -w`            | `uniq -D`                            | macOS does not support `-w` option              |
| `bash scriptname.sh` | `./scriptname.sh` (after `chmod +x`) | macOS allows execution if permission is set     |
| `/proc` paths        | N/A                                  | Not used — macOS does not have `/proc`          |

## 💻 Steps You Used to Make It Work on Mac

Made script executable<br>
`chmod +x duplicate_finder.sh`

Created test folder with duplicate files<br>
```
mkdir ~/Documents/test_duplicates

echo "This is file A" > ~/Documents/test_duplicates/fileA.txt

cp ~/Documents/test_duplicates/fileA.txt ~/Documents/test_duplicates/copy_fileA.txt
```

Ran the script<br>
`./duplicate_finder.sh`

Saved and pushed project changes<br>
```
git add .

git commit -m "Updated mac-compatible duplicate finder"

git push origin main
```
---

## 🧩 Menu Driven Interface  
<img width="586" height="118" alt="Screenshot 2025-11-03 at 12 20 52 PM" src="https://github.com/user-attachments/assets/2385d750-2b6a-46e2-a037-9d0152771799" />




---

## 🧾 Code Structure  

### 1️⃣ duplicate_finder.sh
Main bash script that controls the full functionality.

### 📂 Functions Implemented
| Function | Purpose |
|-----------|----------|
| `scan_directory()` | Scans directory recursively and stores hash-based file details. |
| `show_duplicates()` | Displays files with identical hashes. |

---

## 🧪 Example Output

<img width="618" height="210" alt="Screenshot 2025-11-03 at 12 05 59 PM" src="https://github.com/user-attachments/assets/803d18ff-8d67-4bf1-b41a-1702e7388e6a" />

<img width="618" height="266" alt="Screenshot 2025-11-03 at 12 06 48 PM" src="https://github.com/user-attachments/assets/5695cf1c-4c04-41d7-96d9-b9d216118f45" />
<img width="596" height="188" alt="Screenshot 2025-11-03 at 12 07 11 PM" src="https://github.com/user-attachments/assets/c7a54918-ea36-40cd-b77c-a5e71116dfb4" />


---

## 🧰 Sample Commands Used

find "$directory" -type f -exec md5sum {} + | sort | awk 'BEGIN{lasthash=""} $1==lasthash{print $2} {lasthash=$1}'
📦 Output File
A report named like:


duplicate_report_2025-11-01.txt
is automatically saved in the project folder when you choose “Save Report to File”.

## 💡 Future Enhancements
Add an interactive confirmation before deletion.

Integrate logging for deleted files.

Add PDF report generation using enscript and ps2pdf.

Implement color-coded duplicate groups.
