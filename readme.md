# rTeX

[Deployed example here](http://rtex.probablyaweb.site/)

Minimal LaTeX rendering server.

Requirements:
- Python 3.13
- The libraries in `requirements.txt`
- An installation of LaTeX, of some description.
	- MikTeX and TeXLive both work decently.
- A command called `convert`. I think it's part of imagemagik but I'm not sure.

Originally by dxsmiley. Forked by classabbyamp to add docker support. Forked again by jaytotheay to update docker images and re-add trim.

## Security Concerns

The following settings should be applied to your `texmf.cnf` file in order to prevent security breaches:

```
shell_escape = f
parse_first_line = f
openout_any = p
openin_any = p
```

More details [here](https://tex.stackexchange.com/questions/10418/how-can-i-safely-compile-other-peoples-latex-documents).


## Docker

Sample `docker-compose.yml`:

```yaml
version: '3'
  services:
    rtex:
      image: "docker.pkg.github.com/classabbyamp/rtex/rtex:latest"
      restart: on-failure
      volumes:
        - "./data:/app/data:rw"
      environment:
	- PYTHONUNBUFFERED=1
```
