#!/usr/bin/env python3
ALIASES="""
gap: git add -p
gcp: git checkout -p
gds: git diff --staged
gc: git commit -m 
"""[1:]

TEMPATE = """

if [[ $BUFFER == '{snippet}' ]]; then
        LBUFFER='{cmd}'
fi
&&
"""
lines = [l.split(": ") for l in ALIASES.splitlines()]
print("\n".join([TEMPATE.format(snippet=snippet, cmd=cmd) for snippet, cmd in lines]))

