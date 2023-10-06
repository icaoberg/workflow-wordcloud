# Use the official Python 3.11.6 Alpine image as a base
FROM python:3.11.6-alpine

# Set metadata labels
LABEL MAINTAINER="icaoberg" \
      EMAIL="icaoberg@psc.edu" \
      SUPPORT="https://github.com/icaoberg/workflow-wordcloud/issues" \
      REPOSITORY="https://github.com/icaoberg/workflow-wordcloud" \
      COPYRIGHT="Copyright © 2023 Pittsburgh Supercomputing Center. All Rights Reserved." \
      VERSION="1.9.2"

# Install dependencies
RUN pip install Pillow numpy matplotlib wordcloud ipython

ENTRYPOINT ["python", "/opt/book2wordcloud.py"]
