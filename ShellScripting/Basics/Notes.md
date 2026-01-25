# 🐧 Bash Scripting Cheat Sheet

## 📌 Shebang

```bash
#!/bin/bash
```

Tells the system to run the script using **bash**

---

## 💬 Comments

```bash
# This is a comment
```

---

## 📦 Variables

### Assign:

```bash
VAR_NAME=VALUE
```

### From command output:

```bash
VAR_NAME=$(command)
```

### Access:

```bash
$VAR_NAME
```

---

## 🖨 Print Output

```bash
echo "Hello"
```

---

## ✅ Exit Status

```
0        → success
non-zero → failure
```

Check last command status:

```bash
echo $?
```

---

## 📁 File Checks

```bash
-f file   # file exists
-d dir    # directory exists
```

---

## 📄 Redirection

```bash
>   # overwrite
>>  # append
```

---

## 🔀 Conditions

### Basic if:

```bash
if [ condition ]
then
    command
else
    command
fi
```

### With elif:

```bash
if [ condition ]
then
    command
elif [ condition ]
then
    command
else
    command
fi
```

---

### 🔢 Numeric Comparisons

| Operator | Meaning          |
| -------- | ---------------- |
| -eq      | equal            |
| -ne      | not equal        |
| -gt      | greater than     |
| -ge      | greater or equal |
| -lt      | less than        |
| -le      | less or equal    |

---

## 🔁 Loops

### For loop:

```bash
for i in VAR
do
    command
done
```

### While loop:

```bash
while [ condition ]
do
    command
done
```

---

## ⌨ User Input

```bash
read VAR_NAME
read -p "Message: " VAR_NAME
```

---

## 📥 Script Arguments

Number of arguments:

```bash
$#
```

Check if input given:

```bash
if [ $# -eq 0 ]
then
    command
fi
```

---

## 🧩 Functions

### Define:

```bash
function_name() {
    command
}
```

### Call:

```bash
function_name
```

---

### 📤 Capture output:

```bash
VAR=$(function_name)
```

---

### 📦 With arguments:

```bash
function_name arg1 arg2
```

Inside function:

```bash
$1  $2
```

---

## 🚨 Important Note

Bash functions don’t return text using `return`.  
Use `echo` and capture with `$(...)`.
