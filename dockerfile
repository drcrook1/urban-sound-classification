FROM gcr.io/tensorflow/tensorflow:latest

RUN apt-get update
RUN apt-get ffmpeg
RUN pip install librosa
RUN apt-get install -qq build-essential libssl-dev libffi-dev python-dev curl
RUN pip install Flask azure-storage
RUN apt-get install -qq python-qt4
RUN pip uninstall -y numpy
RUN pip install --no-binary=:all: numpy --upgrade
RUN pip install pandas
RUN pip install python_speech_features

COPY ./ /app/urbansound_classification
ADD entry.sh /app/
RUN chmod +x /app/entry.sh

EXPOSE 80

ENTRYPOINT ["/app/entry.sh"]