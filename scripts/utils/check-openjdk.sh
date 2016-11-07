    x="h"
    {
        x=$(type -p javac)
    } >&-
    if [ -n "$x" ]; then
        _javac=javac
        return 0
    elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/javac" ]];  then
        _javac="$JAVA_HOME/bin/javac"
        return 0
    fi
    if [[ "$_javac" ]]; then
        version=$("$_javac" -version 2>&1 | awk -F ' ' '/javac/ {print $2}')
        echo Found openjdk $version
        return 0
    else
        echo javac not found
        return 1
    fi
