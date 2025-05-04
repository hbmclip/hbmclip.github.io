
# CookBook Series

## How to run an external program?

### Example 1 - Return to variable string (Basic form)

```bash
hbmclip https://raw.githubusercontent.com/hbmclip/cookbook/refs/heads/main/exec/exec01.prg
```

```harbour
EXEC "ls -l" TO aResult
```

---

### Example 2 - Return to Array

```bash
hbmclip https://github.com/hbmclip/cookbook/raw/refs/heads/main/exec/exec02.prg
```

Use `AS ARRAY` clause:

```harbour
EXEC "ls -l" TO aResult AS ARRAY
```

Each line is an array element.

---

### Example 3 - Get error message from external program

```bash
hbmclip https://github.com/hbmclip/cookbook/raw/refs/heads/main/exec/exec03.prg
```

The `ERROR` clause will assign the error value returned from the Operating System to variable `cError`.

```harbour
EXEC "InexistentCommand" TO aResult ERROR cError AS ARRAY
```

---

### Example 4 - Get errorlevel number

```bash
hbmclip https://raw.githubusercontent.com/hbmclip/cookbook/refs/heads/main/exec/exec04.prg
```

```harbour
EXEC "ls" ERRORLEVEL nErrorLevel
```

---

### Example 5 - Passing Params (Basic form)

```bash
hbmclip https://raw.githubusercontent.com/hbmclip/cookbook/refs/heads/main/exec/exec05.prg
```

```harbour
EXEC "ls "-l -a -h" TO cResult ERROR cError ERRORLEVEL nErrorLevel
```

#### Using `PARAMETERS` clause

```bash
hbmclip https://raw.githubusercontent.com/hbmclip/cookbook/refs/heads/main/exec/exec06.prg
```

```harbour
EXEC "ls" PARAMETERS { "-l" , "-a" , "-h" } TO cResult ERROR cError ERRORLEVEL nErrorLevel
```


