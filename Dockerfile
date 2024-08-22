FROM debian:bookworm-slim

RUN apt update && apt install -y make ruby-mustache pandoc texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra

WORKDIR /workdir

CMD [ "pandoc" ]