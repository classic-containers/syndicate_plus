FROM classiccontainers/dosbox

# Retrieve game data from archive.org
ADD --chown=dosbox:dosbox https://archive.org/download/msdos_Syndicate_Plus_1994/Syndicate_Plus_1994.zip syndicate.zip

# Extract game, remove original zip
RUN unzip syndicate.zip && \
    rm syndicate.zip

# Copy dosbox conf with Syndicate Plus autoexec
COPY --chown=dosbox:dosbox dosbox_syndicate.conf dosbox_syndicate.conf

# Add above dosbox conf to dosbox command line
CMD ["-conf", "dosbox_syndicate.conf"]
